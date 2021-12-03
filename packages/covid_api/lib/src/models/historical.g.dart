// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'historical.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Historical _$HistoricalFromJson(Map<String, dynamic> json) => Historical(
      country: json['country'] as String?,
      province: (json['province'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      timeline: json['timeline'] == null
          ? null
          : Timeline.fromJson(json['timeline'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HistoricalToJson(Historical instance) =>
    <String, dynamic>{
      'country': instance.country,
      'province': instance.province,
      'timeline': instance.timeline,
    };

Timeline _$TimelineFromJson(Map<String, dynamic> json) => Timeline(
      cases: _dateTimeFromJson(json['cases'] as Map<String, dynamic>),
      deaths: _dateTimeFromJson(json['deaths'] as Map<String, dynamic>),
      recovered: _dateTimeFromJson(json['recovered'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TimelineToJson(Timeline instance) => <String, dynamic>{
      'cases': _dateTimeToJson(instance.cases),
      'deaths': _dateTimeToJson(instance.deaths),
      'recovered': _dateTimeToJson(instance.recovered),
    };
