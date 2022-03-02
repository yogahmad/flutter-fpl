import 'dart:convert';

import 'package:fpl/models/team.dart';
import 'common_client.dart';

class TeamRepository {
  static final client = CommonClient();

  Future<List<Team>> getTeamList() async {
    var result = await client.get("teams/");
    var body = json.decode(utf8.decode(result.bodyBytes));
    List<dynamic> teamList = body["teams"];
    return teamList
        .map<Team>(
          (team) => Team.fromJson(team),
        )
        .toList();
  }
}
