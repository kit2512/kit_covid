import 'package:covid_api/covid_api.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Country extends Equatable {
  final String country;
  final String flag;
  final int cases;
  final int deaths;
  final int recovered;
  final int active;
  final int critical;
  final int population;
  final Historical? historical;

  const Country({
    required this.country,
    required this.flag,
    required this.cases,
    required this.deaths,
    required this.recovered,
    required this.active,
    required this.critical,
    required this.population,
    required this.historical,
  });

  @override
  List<Object?> get props => [];
}
