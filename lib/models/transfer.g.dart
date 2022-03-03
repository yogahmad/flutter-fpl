// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Transfer _$TransferFromJson(Map<String, dynamic> json) => Transfer(
      Player.fromJson(json['playerIn'] as Map<String, dynamic>),
      Player.fromJson(json['playerOut'] as Map<String, dynamic>),
      json['gameweek'] as int,
    );

Map<String, dynamic> _$TransferToJson(Transfer instance) => <String, dynamic>{
      'playerIn': instance.playerIn,
      'playerOut': instance.playerOut,
      'gameweek': instance.gameweek,
    };
