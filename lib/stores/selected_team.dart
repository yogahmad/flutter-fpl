import 'dart:convert';

import 'package:fpl/configs/positions.dart';
import 'package:fpl/models/player.dart';
import 'package:fpl/repositories/common_shared_preferences.dart';
import 'package:mobx/mobx.dart';

part 'selected_team.g.dart';

class SelectedTeamStore = _SelectedTeamStore with _$SelectedTeamStore;

abstract class _SelectedTeamStore with Store {
  @observable
  ObservableList<Player> goalkeepers = ObservableList<Player>();
  @observable
  ObservableList<Player> defenders = ObservableList<Player>();
  @observable
  ObservableList<Player> midfielders = ObservableList<Player>();
  @observable
  ObservableList<Player> forwards = ObservableList<Player>();

  @computed
  bool get isGkFull => goalkeepers.length >= 2;

  @computed
  bool get isDefFull => defenders.length >= 5;

  @computed
  bool get isMidFull => midfielders.length >= 5;

  @computed
  bool get isFwdFull => forwards.length >= 3;

  _SelectedTeamStore() {
    loadPlayers();
  }

  void loadPlayers() {
    // Goalkeeper
    var gkJson = CommonSharedPreferences.getStringList(
      SharedPreferencesKeyList.selectedGkData,
    );
    if (gkJson != null) {
      goalkeepers = ObservableList<Player>();
      goalkeepers = ObservableList.of(gkJson.map<Player>((data) {
        return Player.fromJson(json.decode(data));
      }).toList());
    }

    // Defender
    var defJson = CommonSharedPreferences.getStringList(
      SharedPreferencesKeyList.selectedDefData,
    );
    if (defJson != null) {
      defenders = ObservableList<Player>();
      defenders = ObservableList.of(defJson.map<Player>((data) {
        return Player.fromJson(json.decode(data));
      }).toList());
    }

    // Midfielder
    var midJson = CommonSharedPreferences.getStringList(
      SharedPreferencesKeyList.selectedMidData,
    );
    if (midJson != null) {
      midfielders = ObservableList<Player>();
      midfielders = ObservableList.of(midJson.map<Player>((data) {
        return Player.fromJson(json.decode(data));
      }).toList());
    }

    // Forward
    var fwdJson = CommonSharedPreferences.getStringList(
      SharedPreferencesKeyList.selectedFwdData,
    );
    if (fwdJson != null) {
      forwards = ObservableList<Player>();
      forwards = ObservableList.of(fwdJson.map<Player>((data) {
        return Player.fromJson(json.decode(data));
      }).toList());
    }
  }

  @action
  Future<void> removePlayer(Player player) async {
    int index =
        goalkeepers.indexWhere((element) => (element.fplId == player.fplId));
    if (index != -1) {
      goalkeepers.removeAt(index);
    }
    index = defenders.indexWhere((element) => (element.fplId == player.fplId));
    if (index != -1) {
      defenders.removeAt(index);
    }
    index =
        midfielders.indexWhere((element) => (element.fplId == player.fplId));
    if (index != -1) {
      midfielders.removeAt(index);
    }
    index = forwards.indexWhere((element) => (element.fplId == player.fplId));
    if (index != -1) {
      forwards.removeAt(index);
    }
  }

  @action
  Future<void> addPlayer(Player player, String position) async {
    if (goalkeepers
        .where((element) => element.fplId == player.fplId)
        .isNotEmpty) {
      return;
    }
    if (defenders
        .where((element) => element.fplId == player.fplId)
        .isNotEmpty) {
      return;
    }
    if (midfielders
        .where((element) => element.fplId == player.fplId)
        .isNotEmpty) {
      return;
    }
    if (forwards.where((element) => element.fplId == player.fplId).isNotEmpty) {
      return;
    }

    switch (position) {
      case Positions.gk:
        goalkeepers.add(player);
        await CommonSharedPreferences.setStringList(
          SharedPreferencesKeyList.selectedGkData,
          goalkeepers
              .map<String>((player) => json.encode(player.toJson()))
              .toList(),
        );
        break;
      case Positions.def:
        defenders.add(player);
        await CommonSharedPreferences.setStringList(
          SharedPreferencesKeyList.selectedDefData,
          goalkeepers
              .map<String>((player) => json.encode(player.toJson()))
              .toList(),
        );
        break;
      case Positions.mid:
        midfielders.add(player);
        await CommonSharedPreferences.setStringList(
          SharedPreferencesKeyList.selectedMidData,
          midfielders
              .map<String>((player) => json.encode(player.toJson()))
              .toList(),
        );
        break;
      case Positions.fwd:
        forwards.add(player);
        await CommonSharedPreferences.setStringList(
          SharedPreferencesKeyList.selectedFwdData,
          forwards
              .map<String>((player) => json.encode(player.toJson()))
              .toList(),
        );
        break;
    }
  }
}
