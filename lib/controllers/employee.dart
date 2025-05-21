import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:zen_app/api/apis.dart';
import 'package:zen_app/core/models/country_model.dart';

class CountryService {
  Future<Map<String, dynamic>> fetchCountry() async {
    //  Uri.parse(
    //       '${Apis.baseUrl}${Apis.data}?drilldowns=Nation&measures=Population'),
    var response = await http.get(
      Uri.parse(
          '${Apis.baseUrl}${Apis.data}?drilldowns=Nation&measures=Population'),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        // 'Authorization': 'Bearer ${StorageService().getString('token')}'
      },
    ).timeout(
      const Duration(seconds: 60),
    );

    // dPrint('statusCode::: ${response.statusCode}');
    // dev.log('response::: ${response.body}');

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<Countrymodel> countryData = (data['data'] as List)
          .map((json) => Countrymodel.fromJson(json))
          .toList();
      // PaginationMeta paginationMeta = PaginationMeta.fromJson(data['meta']);
      return {'data': countryData};
    } else {
      // dPrint('error ${response.body}');
      throw Exception('Failed to load transactions');
    }
  }
}
