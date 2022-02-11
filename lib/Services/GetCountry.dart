import 'dart:convert';

import 'package:practiceflutter/Models/CountryModel.dart';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class Service_country {
  Future<CountryModel> fetchCountry() async {
    // ignore: prefer_typing_uninitialized_variables
    var countrymodel;
    final response =
        await http.get(Uri.parse('https://api.covid19api.com/summary'));
    try {
      if (response.statusCode == 200) {
        countrymodel = CountryModel.fromJson(jsonDecode(response.body));
        return countrymodel;
      }
    } catch (e) {
      return countrymodel;
    }
    return countrymodel;
  }
}
