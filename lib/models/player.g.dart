// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Player _$PlayerFromJson(Map<String, dynamic> json) => Player(
      json['fpl_id'] as int,
      json['full_name'] as String,
      json['display_name'] as String,
      json['price'] as int,
      json['photo_id'] as String,
      json['chance_of_playing_this_round'] as int?,
      json['chance_of_playing_next_round'] as int?,
      json['position'] as String,
      json['understat_id'] as int?,
      json['team'] as String,
      json['team_id'] as int,
    );

Map<String, dynamic> _$PlayerToJson(Player instance) => <String, dynamic>{
      'fpl_id': instance.fplId,
      'full_name': instance.fullName,
      'display_name': instance.displayName,
      'price': instance.price,
      'photo_id': instance.photoId,
      'chance_of_playing_this_round': instance.chanceOfPlayingThisRound,
      'chance_of_playing_next_round': instance.chanceOfPlayingNextRound,
      'position': instance.position,
      'understat_id': instance.understatId,
      'team': instance.team,
      'team_id': instance.teamId,
    };
