part of 'country_cubit.dart';

enum CountryStatus {
  initial,
  loading,
  success,
  failure,
}

extension CountryStatusX on CountryStatus {
  bool get isInitial => this == CountryStatus.initial;
  bool get isLoading => this == CountryStatus.loading;
  bool get isSuccess => this == CountryStatus.success;
  bool get isFailure => this == CountryStatus.failure;
}

@immutable
class CountryState extends Equatable {
  final CountryStatus status;
  final Country country;

  CountryState({
    this.status = CountryStatus.initial,
    Country? country,
  }) : country = country ?? CountryX.empty();
  @override
  List<Object?> get props => [status, country];

  CountryState copyWith({
    CountryStatus? status,
    Country? country,
  }) {
    return CountryState(
        status: status ?? this.status, country: country ?? this.country);
  }
}
