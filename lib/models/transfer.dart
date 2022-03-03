import 'package:fpl/models/player.dart';
import 'package:json_annotation/json_annotation.dart';

part 'transfer.g.dart';

@JsonSerializable()
class Transfer {
  Transfer(this.playerIn, this.playerOut, this.gameweek);

  final Player playerIn;
  final Player playerOut;
  final int gameweek;

  factory Transfer.fromJson(Map<String, dynamic> json) =>
      _$TransferFromJson(json);
  Map<String, dynamic> toJson() => _$TransferToJson(this);
}
