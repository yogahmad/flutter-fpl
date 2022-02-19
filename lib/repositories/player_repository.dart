import 'dart:convert';

import 'package:fpl/models/player.dart';
import 'common_client.dart';

class PlayerRepository {
  static final client = CommonClient();

  Future<List<Player>> getPlayerList() async {
    var result = await client.get("players/");
    var body = json.decode(result.body);
    List<dynamic> playerList = body["players"];
    return playerList
        .map<Player>(
          (player) => Player.fromJson(player),
        )
        .toList();
  }
}
