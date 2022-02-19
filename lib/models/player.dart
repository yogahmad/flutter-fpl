import 'package:json_annotation/json_annotation.dart';

part 'player.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Player {
  Player(
    this.fplId,
    this.fullName,
    this.displayName,
    this.price,
    this.photoId,
    this.chanceOfPlayingThisRound,
    this.chanceOfPlayingNextRound,
    this.position,
    this.understatId,
    this.team,
  );

  final int fplId;
  final String fullName;
  final String displayName;
  final int price;
  final String photoId;
  final int? chanceOfPlayingThisRound;
  final int? chanceOfPlayingNextRound;
  final String position;
  final int? understatId;
  final String team;

  factory Player.fromJson(Map<String, dynamic> json) => _$PlayerFromJson(json);
  Map<String, dynamic> toJson() => _$PlayerToJson(this);
}
