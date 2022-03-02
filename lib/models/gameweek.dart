import 'package:json_annotation/json_annotation.dart';
import 'package:fpl/models/match.dart';

part 'gameweek.g.dart';

@JsonSerializable()
class Gameweek {
  Gameweek(this.number, this.matches);

  final int number;
  final List<Match> matches;

  factory Gameweek.fromJson(Map<String, dynamic> json) =>
      _$GameweekFromJson(json);
  Map<String, dynamic> toJson() => _$GameweekToJson(this);
}
