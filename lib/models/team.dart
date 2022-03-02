import 'package:json_annotation/json_annotation.dart';

part 'team.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Team {
  Team(
    this.fplId,
    this.name,
    this.shortName,
  );

  final int fplId;
  final String name;
  final String shortName;

  factory Team.fromJson(Map<String, dynamic> json) => _$TeamFromJson(json);
  Map<String, dynamic> toJson() => _$TeamToJson(this);
}
