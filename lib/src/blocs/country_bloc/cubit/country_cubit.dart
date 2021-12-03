import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:covid_repository/covid_repository.dart';

part 'country_state.dart';

extension CountryX on Country {
  static Country empty() => const Country(
        country: "--",
        flag: "https://disease.sh/assets/img/flags/unknown.png",
        cases: 0,
        deaths: 0,
        recovered: 0,
        active: 0,
        critical: 0,
        population: 0,
        historical: null,
      );
  Country copyWith({
    String? country,
    String? flag,
    int? cases,
    int? deaths,
    int? recovered,
    int? active,
    int? critical,
    int? population,
    Historical? historical,
  }) {
    return Country(
        country: country ?? this.country,
        flag: flag ?? this.flag,
        cases: cases ?? this.cases,
        deaths: deaths ?? this.deaths,
        recovered: recovered ?? this.recovered,
        active: active ?? this.active,
        critical: critical ?? this.critical,
        population: population ?? this.population,
        historical: historical ?? this.historical);
  }
}

class CountryCubit extends Cubit<CountryState> {
  final CovidRepository _repository;
  CountryCubit(this._repository) : super(CountryState());

  Future<void> fetchCountry(String? countryName) async {
    if (countryName == null || countryName.isEmpty) return;
    emit(state.copyWith(
      status: CountryStatus.loading,
    ));
    try {
      final country = await _repository.getCountry(countryName);
      emit(state.copyWith(
        status: CountryStatus.success,
        country: country,
      ));
    } catch (e) {
      emit(state.copyWith(status: CountryStatus.failure));
    }
  }
}
