import 'dart:convert';

import 'package:flutter/foundation.dart';
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

  @observable
  ObservableList<Player> starters = ObservableList<Player>();
  @observable
  ObservableList<Player> bench = ObservableList<Player>();

  @observable
  Player? substitutedPlayer;
  @observable
  ObservableMap<int, bool> isValidAsASubstitution = ObservableMap<int, bool>();

  @computed
  bool get isGkFull => goalkeepers.length >= 2;

  @computed
  bool get isDefFull => defenders.length >= 5;

  @computed
  bool get isMidFull => midfielders.length >= 5;

  @computed
  bool get isFwdFull => forwards.length >= 3;

  @computed
  bool get isFull => isGkFull && isDefFull && isMidFull && isFwdFull;

  _SelectedTeamStore() {
    loadPlayers();
  }

  void loadPlayers() {
    // Goalkeeper
    try {
      var gkJson = CommonSharedPreferences.getStringList(
        SharedPreferencesKeyList.selectedGkData,
      );
      if (gkJson != null) {
        goalkeepers = ObservableList<Player>();
        goalkeepers = ObservableList.of(gkJson.map<Player>((data) {
          return Player.fromJson(json.decode(data));
        }).toList());
      }
    } catch (e) {
      CommonSharedPreferences.setStringList(
        SharedPreferencesKeyList.selectedGkData,
        [],
      );
    }

    // Defender
    try {
      var defJson = CommonSharedPreferences.getStringList(
        SharedPreferencesKeyList.selectedDefData,
      );
      if (defJson != null) {
        defenders = ObservableList<Player>();
        defenders = ObservableList.of(defJson.map<Player>((data) {
          return Player.fromJson(json.decode(data));
        }).toList());
      }
    } catch (e) {
      CommonSharedPreferences.setStringList(
        SharedPreferencesKeyList.selectedDefData,
        [],
      );
    }

    // Midfielder
    try {
      var midJson = CommonSharedPreferences.getStringList(
        SharedPreferencesKeyList.selectedMidData,
      );
      if (midJson != null) {
        midfielders = ObservableList<Player>();
        midfielders = ObservableList.of(midJson.map<Player>((data) {
          return Player.fromJson(json.decode(data));
        }).toList());
      }
    } catch (e) {
      CommonSharedPreferences.setStringList(
        SharedPreferencesKeyList.selectedMidData,
        [],
      );
    }

    // Forward
    try {
      var fwdJson = CommonSharedPreferences.getStringList(
        SharedPreferencesKeyList.selectedFwdData,
      );
      if (fwdJson != null) {
        forwards = ObservableList<Player>();
        forwards = ObservableList.of(fwdJson.map<Player>((data) {
          return Player.fromJson(json.decode(data));
        }).toList());
      }
    } catch (e) {
      CommonSharedPreferences.setStringList(
        SharedPreferencesKeyList.selectedFwdData,
        [],
      );
    }

    if (isFull) {
      loadStarterBench();
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
          defenders
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
    if (isFull) {
      loadStarterBench();
    }
  }

  @action
  void loadStarterBench() {
    var allStarters = <Player>[];
    var allBench = <Player>[];
    allStarters.addAll(goalkeepers.sublist(0, 1));
    allBench.addAll(goalkeepers.sublist(1, 2));
    allStarters.addAll(defenders.sublist(0, 4));
    allBench.addAll(defenders.sublist(4, 5));
    allStarters.addAll(midfielders.sublist(0, 4));
    allBench.addAll(midfielders.sublist(4, 5));
    allStarters.addAll(forwards.sublist(0, 2));
    allBench.addAll(forwards.sublist(2, 3));
    starters = ObservableList.of(allStarters);
    bench = ObservableList.of(allBench);
    for (Player player in starters) {
      isValidAsASubstitution[player.fplId] = true;
    }
    for (Player player in bench) {
      isValidAsASubstitution[player.fplId] = true;
    }
  }

  @action
  void substitutePlayer(Player player) {
    if (substitutedPlayer == null) {
      substitutedPlayer = player;
      verifySubstitutionValidity();
      return;
    }
    if (substitutedPlayer == player) {
      substitutedPlayer = null;
      verifySubstitutionValidity();
      return;
    }
    // swap
    bool isFirstPlayerStarter = starters.contains(substitutedPlayer);
    bool isSecondPlayerStarter = starters.contains(player);

    if (isFirstPlayerStarter == isSecondPlayerStarter) {
      substitutedPlayer = player;
      verifySubstitutionValidity();
      return;
    }
    if (isFirstPlayerStarter) {
      int index1 = starters.indexOf(substitutedPlayer);
      int index2 = bench.indexOf(player);
      starters[index1] = player;
      bench[index2] = substitutedPlayer!;
    } else {
      int index1 = bench.indexOf(substitutedPlayer);
      int index2 = starters.indexOf(player);
      bench[index1] = player;
      starters[index2] = substitutedPlayer!;
    }
    mergeSort(starters,
        compare: (Player p0, Player p1) =>
            Positions.compareTo(p0.position, p1.position));
    mergeSort(bench,
        compare: (Player p0, Player p1) =>
            Positions.compareTo(p0.position, p1.position));
    substitutedPlayer = null;
    verifySubstitutionValidity();
  }

  @action
  void verifySubstitutionValidity() {
    if (substitutedPlayer == null) {
      for (Player player in starters) {
        isValidAsASubstitution[player.fplId] = true;
      }
      for (Player player in bench) {
        isValidAsASubstitution[player.fplId] = true;
      }
      return;
    }
    bool isStarter = starters.contains(substitutedPlayer);

    if (isStarter) {
      for (Player player in starters) {
        isValidAsASubstitution[player.fplId] = true;
      }

      int currentGk = starters
          .where((player) =>
              player.position == Positions.gk && player != substitutedPlayer)
          .length;
      int currentDef = starters
          .where((player) =>
              player.position == Positions.def && player != substitutedPlayer)
          .length;
      int currentMid = starters
          .where((player) =>
              player.position == Positions.mid && player != substitutedPlayer)
          .length;
      int currentFwd = starters
          .where((player) =>
              player.position == Positions.fwd && player != substitutedPlayer)
          .length;

      for (Player player in bench) {
        bool validity = true;
        if (currentGk == 0 && player.position != Positions.gk) {
          validity = false;
        }
        if (currentGk == 1 && player.position == Positions.gk) {
          validity = false;
        }
        if (currentDef == 2 && player.position != Positions.def) {
          validity = false;
        }
        if (currentMid == 1 && player.position != Positions.mid) {
          validity = false;
        }
        if (currentFwd == 0 && player.position != Positions.fwd) {
          validity = false;
        }

        isValidAsASubstitution[player.fplId] = validity;
      }
    } else {
      for (Player player in bench) {
        isValidAsASubstitution[player.fplId] = true;
      }

      int currentGk =
          starters.where((player) => player.position == Positions.gk).length;
      int currentDef =
          starters.where((player) => player.position == Positions.def).length;
      int currentMid =
          starters.where((player) => player.position == Positions.mid).length;
      int currentFwd =
          starters.where((player) => player.position == Positions.fwd).length;

      if (substitutedPlayer!.position == Positions.gk) currentGk += 1;
      if (substitutedPlayer!.position == Positions.def) currentDef += 1;
      if (substitutedPlayer!.position == Positions.mid) currentMid += 1;
      if (substitutedPlayer!.position == Positions.fwd) currentFwd += 1;

      for (Player player in starters) {
        bool validity = true;
        if (currentGk == 1 && player.position == Positions.gk) {
          validity = false;
        }
        if (currentGk == 2 && player.position != Positions.gk) {
          validity = false;
        }
        if (currentDef == 3 && player.position == Positions.def) {
          validity = false;
        }
        if (currentMid == 2 && player.position == Positions.mid) {
          validity = false;
        }
        if (currentFwd == 1 && player.position == Positions.fwd) {
          validity = false;
        }

        isValidAsASubstitution[player.fplId] = validity;
      }
    }
  }
}
