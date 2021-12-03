import 'dart:convert';

import 'models/models.dart';
import 'package:http/http.dart';

class CountryRequestFalure implements Exception {}

class CountryNotFound implements Exception {}

class GlobalRequestFalure implements Exception {}

class AllCountriesRequestFailure implements Exception {}

class HistoricalNotFoundFailure implements Exception {}

class CovidApi {
  final Client _client;
  static const _baseUrl = "disease.sh";

  CovidApi({
    Client? client,
  }) : _client = client ?? Client();

  Future<Country> loadCountry(String countryName) async {
    final String path = "/v3/covid-19/countries/$countryName";
    final uri = Uri.https(_baseUrl, path);
    final response = await _client.get(uri);

    if (response.statusCode != 200) {
      if (response.statusCode == 400) {
        throw CountryNotFound();
      } else
        throw CountryRequestFalure();
    }
    final json = jsonDecode(response.body);
    final country = Country.fromJson(json as Map<String, dynamic>);
    return country;
  }

  Future<Global> loadGlobal() async {
    final path = "/v3/covid-19/all";
    final uri = Uri.https(_baseUrl, path);
    final response = await _client.get(uri);
    if (response.statusCode != 200) {
      throw GlobalRequestFalure();
    }
    final json = jsonDecode(response.body);
    final global = Global.fromJson(json);
    return global;
  }

  Future<List<Country>> loadAllCountries() async {
    final path = "/v3/covid-19/countries";
    final uri = Uri.https(_baseUrl, path);
    final response = await _client.get(uri);
    if (response.statusCode != 200) {
      throw AllCountriesRequestFailure();
    }
    final data = jsonDecode(response.body) as List;
    final List<Country> countries = <Country>[];
    for (var e in data) {
      final country = Country.fromJson(e as Map<String, dynamic>);
      countries.add(country);
    }
    return countries;
  }

  Future<Historical> loadHistorical(String countryName,
      [int lastDays = 7]) async {
    final path = "/v3/covid-19/historical/$countryName";
    final uri = Uri.https(_baseUrl, path, <String, dynamic>{
      "lastdays": "$lastDays",
    });
    final response = await _client.get(uri);
    if (response.statusCode != 200) {
      throw HistoricalNotFoundFailure();
    }

    final json = jsonDecode(response.body);
    final historical = Historical.fromJson(json);
    return historical;
  }
}
