import 'package:json_annotation/json_annotation.dart';

part 'match.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Match {
  Match(
    this.fplId,
    this.awayTeamFplId,
    this.awayTeamName,
    this.awayTeamXgForm,
    this.awayTeamXgcForm,
    this.awayDefenceColor,
    this.awayAttackColor,
    this.homeTeamFplId,
    this.homeTeamName,
    this.homeTeamXgForm,
    this.homeTeamXgcForm,
    this.homeDefenceColor,
    this.homeAttackColor,
  );

  final int fplId;
  final int awayTeamFplId;
  final String awayTeamName;
  final double awayTeamXgForm;
  final double awayTeamXgcForm;
  final int awayDefenceColor;
  final int awayAttackColor;
  final int homeTeamFplId;
  final String homeTeamName;
  final double homeTeamXgForm;
  final double homeTeamXgcForm;
  final int homeDefenceColor;
  final int homeAttackColor;

  factory Match.fromJson(Map<String, dynamic> json) => _$MatchFromJson(json);
  Map<String, dynamic> toJson() => _$MatchToJson(this);
}
