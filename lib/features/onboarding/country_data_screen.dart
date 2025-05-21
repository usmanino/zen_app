import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zen_app/controllers/country_data_controller.dart';

class CountryDataScreen extends StatefulWidget {
  const CountryDataScreen({super.key});

  @override
  State<CountryDataScreen> createState() => _CountryDataScreenState();
}

class _CountryDataScreenState extends State<CountryDataScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final model = Provider.of<CountryDataController>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      model.getCountry(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<CountryDataController>(context);
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Text('data'),
            ],
          ),
        ),
      ),
    );
  }
}
