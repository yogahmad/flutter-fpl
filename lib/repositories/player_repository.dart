import 'dart:convert';

import 'package:fpl/models/player.dart';
import 'common_client.dart';

class PlayerRepository {
  static final client = CommonClient();

  Future<List<Player>> getPlayerList({position}) async {
    if (position == null) {
      var result = await client.get("players/");
      var body = json.decode(utf8.decode(result.bodyBytes));
      List<dynamic> playerList = body["players"];
      return playerList
          .map<Player>(
            (player) => Player.fromJson(player),
          )
          .toList();
    }

    var result = await client.get("players/", params: {
      "position": position,
    });
    var body = json.decode(utf8.decode(result.bodyBytes));
    List<dynamic> playerList = body["players"];
    return playerList
        .map<Player>(
          (player) => Player.fromJson(player),
        )
        .toList();
  }
}
