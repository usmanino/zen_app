import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:zen_app/core/reuseables/custom_input_field.dart';
import 'package:zen_app/features/home/create_route_screen.dart';
import 'package:zen_app/features/home/widgets/home_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
        title: Text(
          'Home',
          style: GoogleFonts.plusJakartaSans(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: const Color(0xff1C170D),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 2.w),
            child: InkResponse(
              onTap: () {},
              child: SvgPicture.asset(
                'assets/dashboard/profile.svg',
                color: const Color(0xff1C170D),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Column(
            children: [
              SizedBox(
                height: 4.h,
              ),
              CustomInputField(
                hintText: 'Search  tasks...',
                hasPrefix: true,
                prefixIcon: Icons.search,
                prefixIconColor: const Color(0xffA1824A),
                controller: searchController,
                filled: true,
                fillColor: const Color(0xffF5F0E5),
              ),
              SizedBox(
                height: 4.h,
              ),
              Wrap(
                spacing: 3.w,
                runSpacing: 4.w,
                children: [
                  HomeCard(
                    image: 'assets/images/route.png',
                    title: 'Create Route',
                    description: 'Start Creating',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const CreateRouteScreen();
                          },
                        ),
                      );
                    },
                  ),
                  HomeCard(
                    image: 'assets/images/pickup.png',
                    title: 'Find Pickups',
                    description: 'Locate Now',
                    onTap: () {},
                  ),
                  HomeCard(
                    image: 'assets/images/notification.png',
                    title: 'Notifications',
                    description: 'Messages',
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
