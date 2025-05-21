import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:zen_app/api/apis.dart';
import 'package:zen_app/controllers/employee.dart';
import 'package:zen_app/core/models/country_model.dart';

class CountryDataController extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final service = CountryService();

  List<Countrymodel> _countrymodels = [];
  List<Countrymodel> get countrymodels => _countrymodels;

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

      final result = await service.fetchCountry();
      _countrymodels = result['data'];

      _isLoading = false;
      notifyListeners();
    } on SocketException {
      _isLoading = false;
      notifyListeners();
      Fluttertoast.showToast(
        msg: 'No Internet Connection',
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    } catch (e, x) {
      print(x);
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

  //  Future<void> getTransactionHistory({
  //   required BuildContext context,
  //   required int currentPage,
  // }) async {
  //   _transactionHistoryModel.clear();
  //   isTransactionHistoryLoading = true;

  //   notifyListeners();
  //   try {
  //     final result =
  //         await _transactionService.fetchTransactions(page: currentPage);
  //     _transactionHistoryModel = result['transactions'];
  //     // final fetchedTransactions = result['transactions'];
  //     _paginationMeta = result['meta'];

  //     // _transactionHistoryModel = fetchedTransactions + _transactionHistoryModel;

  //     isTransactionHistoryLoading = false;
  //     errorType = null;
  //     notifyListeners();
  //     dPrint('redeemed fetched:::');
  //   } on SocketException {
  //     isTransactionHistoryLoading = false;

  //     errorType = ErrorType.socketException;
  //     notifyListeners();
  //   } catch (e, x) {
  //     isTransactionHistoryLoading = false;

  //     errorType = ErrorType.otherException;
  //     notifyListeners();
  //     dPrint("Error received on fetching transactions: ${e.toString()}");
  //     dPrint("Error received on fetching transactions: ${x.toString()}");
  //   }
  // }
}
