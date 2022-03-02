// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Team _$TeamFromJson(Map<String, dynamic> json) => Team(
      json['fpl_id'] as int,
      json['name'] as String,
      json['short_name'] as String,
    );

Map<String, dynamic> _$TeamToJson(Team instance) => <String, dynamic>{
      'fpl_id': instance.fplId,
      'name': instance.name,
      'short_name': instance.shortName,
    };
