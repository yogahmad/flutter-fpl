import 'dart:math';

import 'package:fpl/models/player.dart';
import 'package:fpl/models/response_status.dart';
import 'package:fpl/repositories/player_repository.dart';
import 'package:mobx/mobx.dart';

part 'select_player.g.dart';

class SelectPlayerStore = _SelectPlayerStore with _$SelectPlayerStore;

// The store-class
abstract class _SelectPlayerStore with Store {
  final PlayerRepository _repository = PlayerRepository();
  final int pageSize = 10;

  @observable
  int currentPage = 1;

  @observable
  int totalPage = 1;

  @observable
  Response<List<Player>> players = Response<List<Player>>.loading("Loading");

  @observable
  List<Player> playersInPage = <Player>[];

  @action
  Future<void> fetchAllPlayer() async {
    players = Response<List<Player>>.loading("Loading");
    var result = await _repository.getPlayerList();
    playersInPage = result.sublist(0, min(pageSize, result.length));
    currentPage = 1;
    totalPage = (result.length / pageSize).ceil();
    players = Response.completed(result);
  }

  @action
  void changePage(newPage) {
    playersInPage = players.data!.sublist((newPage - 1) * pageSize,
        min(players.data!.length, newPage * pageSize));
    currentPage = newPage;
  }

  @action
  void nextPage() {
    if (currentPage + 1 <= totalPage) {
      changePage(currentPage + 1);
    }
  }

  @action
  void prevPage() {
    if (currentPage - 1 > 0) {
      changePage(currentPage - 1);
    }
  }
}
