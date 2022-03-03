import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fpl/models/gameweek.dart';
import 'package:fpl/models/response_status.dart';
import 'package:fpl/repositories/common_shared_preferences.dart';
import 'package:fpl/repositories/gameweek_repository.dart';
import 'package:mobx/mobx.dart';
import 'package:tuple/tuple.dart';

part 'gameweek_store.g.dart';

class GameweekStore = _GameweekStore with _$GameweekStore;

abstract class _GameweekStore with Store {
  final GameweekRepository _repository = GameweekRepository();
  @observable
  Response<List<Gameweek>> gameweeks = Response.loading("");

  _GameweekStore() {
    loadData();
  }

  @action
  Future<void> loadData() async {
    if (gameweeks.status != ResponseStatus.loading) return;
    var data = await CommonSharedPreferences.getStringListWithExpireTime(
      SharedPreferencesKeyList.gameweeksData,
      SharedPreferencesKeyList.gameweeksDataExpireTime,
    );
    if (data != null) {
      var result = data
          .map<Gameweek>(
            (gameweek) => Gameweek.fromJson(json.decode(gameweek)),
          )
          .toList();
      gameweeks = Response.completed(result);
      return;
    }
    var result = await _repository.getGameweekList();
    gameweeks = Response.completed(result);
    await CommonSharedPreferences.setStringListWithExpireTime(
      SharedPreferencesKeyList.gameweeksData,
      SharedPreferencesKeyList.gameweeksDataExpireTime,
      result.map((gameweek) => json.encode(gameweek.toJson())).toList(),
    );
  }

  List<Tuple4<String, Color, Color, bool>> getFixture(
      int teamId, int gameweekNumber) {
    List<Tuple4<String, Color, Color, bool>> ret =
        <Tuple4<String, Color, Color, bool>>[];

    for (var gameweek in gameweeks.data!) {
      if (gameweek.number == gameweekNumber) {
        for (var match in gameweek.matches) {
          if (match.awayTeamFplId == teamId) {
            ret.add(Tuple4(match.homeTeamName, Color(match.homeAttackColor),
                Color(match.homeDefenceColor), false));
          } else if (match.homeTeamFplId == teamId) {
            ret.add(Tuple4(match.awayTeamName, Color(match.awayAttackColor),
                Color(match.awayDefenceColor), true));
          }
        }
      }
    }
    return ret;
  }
}
