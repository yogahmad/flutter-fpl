import 'dart:convert';

import 'package:fpl/models/gameweek.dart';
import 'common_client.dart';

class GameweekRepository {
  static final client = CommonClient();

  Future<List<Gameweek>> getGameweekList() async {
    var result = await client.get("gameweeks/");
    var body = json.decode(utf8.decode(result.bodyBytes));
    List<dynamic> gameweekList = body["gameweeks"];
    return gameweekList
        .map<Gameweek>(
          (gameweek) => Gameweek.fromJson(gameweek),
        )
        .toList();
  }
}
