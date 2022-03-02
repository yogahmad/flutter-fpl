// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gameweek.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Gameweek _$GameweekFromJson(Map<String, dynamic> json) => Gameweek(
      json['number'] as int,
      (json['matches'] as List<dynamic>)
          .map((e) => Match.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GameweekToJson(Gameweek instance) => <String, dynamic>{
      'number': instance.number,
      'matches': instance.matches,
    };
