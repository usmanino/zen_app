import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:sizer/sizer.dart';
import 'package:zen_app/core/reuseables/custom_button.dart';
import 'package:zen_app/core/reuseables/custom_input_field.dart';

class CreateRouteScreen extends StatefulWidget {
  const CreateRouteScreen({super.key});

  @override
  State<CreateRouteScreen> createState() => _CreateRouteScreenState();
}

class _CreateRouteScreenState extends State<CreateRouteScreen> {
  final desSearchController = TextEditingController();
  final arivalTimeController = TextEditingController();
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  Location location = Location();
  LocationData? currentLocation;
  Set<Marker> markers = {};

  // Default camera position (will be updated with current location)
  CameraPosition _initialCameraPosition = const CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    // Check if location service is enabled
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    // Check location permissions
    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    try {
      // Get current location
      currentLocation = await location.getLocation();

      if (currentLocation != null) {
        setState(() {
          // Update camera position to current location
          _initialCameraPosition = CameraPosition(
            target:
                LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
            zoom: 16.0,
          );

          // Add marker for current location
          markers.add(
            Marker(
              markerId: const MarkerId('current_location'),
              position: LatLng(
                  currentLocation!.latitude!, currentLocation!.longitude!),
              infoWindow: const InfoWindow(
                title: 'Current Location',
                snippet: 'You are here',
              ),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueBlue),
            ),
          );
        });

        // Move camera to current location if map is already created
        if (_controller.isCompleted) {
          final GoogleMapController controller = await _controller.future;
          controller.animateCamera(
            CameraUpdate.newCameraPosition(_initialCameraPosition),
          );
        }
      }
    } catch (e) {
      print('Error getting location: $e');
    }
  }

  void timePicker() async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) => child!,
    );

    if (pickedTime != null) {
      final formattedTime = pickedTime.format(context);
      arivalTimeController.text = formattedTime;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 30,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 4.h,
                ),
                Text(
                  'Create Route',
                  style: GoogleFonts.inter(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Text(
                  'Destination',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff121417),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                CustomInputField(
                  hintText: 'Search',
                  controller: desSearchController,
                  filled: true,
                  fillColor: const Color(0xffF0F2F5),
                  borderColor: Colors.transparent,
                  enabledBorderColor: Colors.transparent,
                  focusedBorderColor: Colors.transparent,
                ),
                SizedBox(
                  height: 4.h,
                ),
                Container(
                  height: 300,
                  child: GoogleMap(
                    mapType: MapType.normal,
                    initialCameraPosition: _initialCameraPosition,
                    markers: markers,
                    myLocationEnabled: true,
                    myLocationButtonEnabled: true,
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);

                      // If we already have current location, move camera there
                      if (currentLocation != null) {
                        controller.animateCamera(
                          CameraUpdate.newCameraPosition(
                              _initialCameraPosition),
                        );
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Text(
                  'Arrive by',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff121417),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                CustomInputField(
                  hintText: 'Select time',
                  controller: arivalTimeController,
                  filled: true,
                  readOnly: true,
                  onTap: () {
                    timePicker();
                  },
                  fillColor: const Color(0xffF0F2F5),
                  borderColor: Colors.transparent,
                  enabledBorderColor: Colors.transparent,
                  focusedBorderColor: Colors.transparent,
                ),
                SizedBox(
                  height: 4.h,
                ),
                CustomButton(
                  text: 'Set destination',
                  bgColor: const Color(0xff2194F2),
                  onPress: () {
                    // Create Route
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
