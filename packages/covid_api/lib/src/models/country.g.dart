// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Country _$CountryFromJson(Map<String, dynamic> json) => Country(
      updated: json['updated'] as int,
      country: json['country'] as String,
      countryInfo:
          CountryInfo.fromJson(json['countryInfo'] as Map<String, dynamic>),
      cases: json['cases'] as int,
      todayCases: json['todayCases'] as int,
      deaths: json['deaths'] as int,
      todayDeaths: json['todayDeaths'] as int,
      recovered: json['recovered'] as int,
      todayRecovered: json['todayRecovered'] as int,
      active: json['active'] as int,
      critical: json['critical'] as int,
      casesPerOneMillion: json['casesPerOneMillion'] as int,
      deathsPerOneMillion: json['deathsPerOneMillion'] as int,
      tests: json['tests'] as int,
      testsPerOneMillion: json['testsPerOneMillion'] as int,
      population: json['population'] as int,
      continent: json['continent'] as String,
      oneCasePerPeople: json['oneCasePerPeople'] as int,
      oneDeathPerPeople: json['oneDeathPerPeople'] as int,
      oneTestPerPeople: json['oneTestPerPeople'] as int,
      activePerOneMillion: (json['activePerOneMillion'] as num).toDouble(),
      recoveredPerOneMillion:
          (json['recoveredPerOneMillion'] as num).toDouble(),
      criticalPerOneMillion: (json['criticalPerOneMillion'] as num).toDouble(),
    );

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
      'updated': instance.updated,
      'country': instance.country,
      'countryInfo': instance.countryInfo,
      'cases': instance.cases,
      'todayCases': instance.todayCases,
      'deaths': instance.deaths,
      'todayDeaths': instance.todayDeaths,
      'recovered': instance.recovered,
      'todayRecovered': instance.todayRecovered,
      'active': instance.active,
      'critical': instance.critical,
      'casesPerOneMillion': instance.casesPerOneMillion,
      'deathsPerOneMillion': instance.deathsPerOneMillion,
      'tests': instance.tests,
      'testsPerOneMillion': instance.testsPerOneMillion,
      'population': instance.population,
      'continent': instance.continent,
      'oneCasePerPeople': instance.oneCasePerPeople,
      'oneDeathPerPeople': instance.oneDeathPerPeople,
      'oneTestPerPeople': instance.oneTestPerPeople,
      'activePerOneMillion': instance.activePerOneMillion,
      'recoveredPerOneMillion': instance.recoveredPerOneMillion,
      'criticalPerOneMillion': instance.criticalPerOneMillion,
    };

CountryInfo _$CountryInfoFromJson(Map<String, dynamic> json) => CountryInfo(
      iId: json['_id'] as int?,
      iso2: json['iso2'] as String?,
      iso3: json['iso3'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      long: (json['long'] as num?)?.toDouble(),
      flag: json['flag'] as String?,
    );

Map<String, dynamic> _$CountryInfoToJson(CountryInfo instance) =>
    <String, dynamic>{
      '_id': instance.iId,
      'iso2': instance.iso2,
      'iso3': instance.iso3,
      'lat': instance.lat,
      'long': instance.long,
      'flag': instance.flag,
    };
