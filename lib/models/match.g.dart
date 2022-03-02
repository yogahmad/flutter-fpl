// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Match _$MatchFromJson(Map<String, dynamic> json) => Match(
      json['fpl_id'] as int,
      json['away_team_fpl_id'] as int,
      json['away_team_name'] as String,
      (json['away_team_xg_form'] as num).toDouble(),
      (json['away_team_xgc_form'] as num).toDouble(),
      json['away_defence_color'] as int,
      json['away_attack_color'] as int,
      json['home_team_fpl_id'] as int,
      json['home_team_name'] as String,
      (json['home_team_xg_form'] as num).toDouble(),
      (json['home_team_xgc_form'] as num).toDouble(),
      json['home_defence_color'] as int,
      json['home_attack_color'] as int,
    );

Map<String, dynamic> _$MatchToJson(Match instance) => <String, dynamic>{
      'fpl_id': instance.fplId,
      'away_team_fpl_id': instance.awayTeamFplId,
      'away_team_name': instance.awayTeamName,
      'away_team_xg_form': instance.awayTeamXgForm,
      'away_team_xgc_form': instance.awayTeamXgcForm,
      'away_defence_color': instance.awayDefenceColor,
      'away_attack_color': instance.awayAttackColor,
      'home_team_fpl_id': instance.homeTeamFplId,
      'home_team_name': instance.homeTeamName,
      'home_team_xg_form': instance.homeTeamXgForm,
      'home_team_xgc_form': instance.homeTeamXgcForm,
      'home_defence_color': instance.homeDefenceColor,
      'home_attack_color': instance.homeAttackColor,
    };
