import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

part 'historical.g.dart';

@JsonSerializable()
class Historical extends Equatable {
  final String? country;
  final List<String?>? province;
  final Timeline? timeline;

  const Historical({
    required this.country,
    required this.province,
    required this.timeline,
  });

  factory Historical.fromJson(Map<String, dynamic> json) {
    return _$HistoricalFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HistoricalToJson(this);

  @override
  List<Object?> get props => [country, province, timeline];
}

@JsonSerializable()
class Timeline extends Equatable {
  @JsonKey(fromJson: _dateTimeFromJson, toJson: _dateTimeToJson)
  final Map<DateTime, int>? cases;
  @JsonKey(fromJson: _dateTimeFromJson, toJson: _dateTimeToJson)
  final Map<DateTime, int>? deaths;
  @JsonKey(fromJson: _dateTimeFromJson, toJson: _dateTimeToJson)
  final Map<DateTime, int>? recovered;

  Timeline({
    required this.cases,
    required this.deaths,
    required this.recovered,
  });

  factory Timeline.fromJson(Map<String, dynamic> json) {
    return _$TimelineFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TimelineToJson(this);

  @override
  List<Object?> get props => [cases, deaths, recovered];
}

Map<DateTime, int>? _dateTimeFromJson(Map<String, dynamic> json) {
  final map = <DateTime, int>{};
  try {
    json.forEach((key, value) {
      final formatter = DateFormat("MM/DD/yy");
      final newEntry = MapEntry(formatter.parse(key), value as int);
      map.addEntries([newEntry]);
    });
  } catch (e) {
    print(e);
  }
  return map;
}

Map<String, dynamic>? _dateTimeToJson(Map<DateTime, int>? json) {
  if (json != null) {
    return json.map((key, value) {
      final formatter = DateFormat("MM/DD/yy");
      final dtString = formatter.format(key).toString();
      return MapEntry(dtString, value);
    });
  } else {
    return null;
  }
}
