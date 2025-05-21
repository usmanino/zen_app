import 'dart:io';

import 'package:flutter/cupertino.dart';
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
    return Scaffold(
      body: model.isLoading
          ? Center(
              child: Platform.isIOS
                  ? CupertinoActivityIndicator()
                  : CircularProgressIndicator(),
            )
          : SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: model.countrymodels.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title:
                                Text(model.countrymodels[index].nation ?? '--'),
                            subtitle: Text(
                                model.countrymodels[index].idNation ?? '--'),
                            trailing: Text(
                              model.countrymodels[index].idYear.toString(),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
