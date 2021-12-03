import 'package:covid_api/covid_api.dart' hide Country;
import 'models/models.dart';

class CovidRepository {
  final CovidApi _covidApi;

  CovidRepository(CovidApi? covidApi) : _covidApi = covidApi ?? CovidApi();

  Future<Country> getCountry(String countryName, [int lastDays = 7]) async {
    final country = await _covidApi.loadCountry(countryName);
    final historical = await _covidApi.loadHistorical(countryName, lastDays);
    final result = Country(
        country: country.country,
        flag: country.countryInfo.flag as String,
        cases: country.cases,
        deaths: country.deaths,
        recovered: country.recovered,
        active: country.active,
        critical: country.critical,
        population: country.population,
        historical: historical);
    return result;
  }
}
