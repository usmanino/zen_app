import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:zen_app/api/apis.dart';

class CountryDataController extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  // void getUser() {
  //   try {
  //     _isLoading = true;
  //     notifyListeners();

  //   } on SocketException {

  //   } catch (e) {}
  // }

  Future<void> getCountry(BuildContext context) async {
    try {
      _isLoading = true;
      notifyListeners();

      var response = await http.get(
        Uri.parse(Apis.baseUrl + Apis.data),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          // 'Authorization': 'Bearer ${StorageService().getString('token')}'
        },
      ).timeout(const Duration(seconds: 60));

      print('statusCode::: ${response.statusCode}');
      print('response::: ${response.body}');

      //success
      if (response.statusCode == 200 || response.statusCode == 201) {
        // Wallets? wallets =
        //     Wallets.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
        // _walletsService.setWalletsData = wallets.data;
        // dPrint('Wallets fetched:::');
        // //isLoading = false;
        // //notifyListeners();
        // fetchCurrencies(context);
      }
      //failure
      else {
        _isLoading = false;
        notifyListeners();
        print('error ${response.body}');
        Fluttertoast.showToast(
          msg: json.decode(response.body),
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );
      }
    } on SocketException {
      _isLoading = false;
      notifyListeners();
      Fluttertoast.showToast(
        msg: 'No Internet Connection',
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      print("Error received on fetching wallets: ${e.toString()}");
      Fluttertoast.showToast(
        msg: 'Something went wrong',
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }
}
