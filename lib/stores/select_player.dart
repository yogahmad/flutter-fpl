import 'dart:math';

import 'package:diacritic/diacritic.dart';
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
  String searchField = "";
  int minPrice = 0;
  int maxPrice = 200;
  List<Player> filteredPlayers = <Player>[];

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
    filteredPlayers = result;
    searchField = "";
    players = Response.completed(result);
  }

  @action
  Future<void> fetchGoalkeeper() async {
    players = Response<List<Player>>.loading("Loading");
    var result = await _repository.getPlayerList(position: "1");
    playersInPage = result.sublist(0, min(pageSize, result.length));
    currentPage = 1;
    totalPage = (result.length / pageSize).ceil();
    filteredPlayers = result;
    searchField = "";
    players = Response.completed(result);
  }

  @action
  Future<void> fetchDefender() async {
    players = Response<List<Player>>.loading("Loading");
    var result = await _repository.getPlayerList(position: "2");
    playersInPage = result.sublist(0, min(pageSize, result.length));
    currentPage = 1;
    totalPage = (result.length / pageSize).ceil();
    filteredPlayers = result;
    searchField = "";
    players = Response.completed(result);
  }

  @action
  Future<void> fetchMidfielder() async {
    players = Response<List<Player>>.loading("Loading");
    var result = await _repository.getPlayerList(position: "3");
    playersInPage = result.sublist(0, min(pageSize, result.length));
    currentPage = 1;
    totalPage = (result.length / pageSize).ceil();
    filteredPlayers = result;
    searchField = "";
    players = Response.completed(result);
  }

  @action
  Future<void> fetchForward() async {
    players = Response<List<Player>>.loading("Loading");
    var result = await _repository.getPlayerList(position: "4");
    playersInPage = result.sublist(0, min(pageSize, result.length));
    currentPage = 1;
    totalPage = (result.length / pageSize).ceil();
    filteredPlayers = result;
    searchField = "";
    players = Response.completed(result);
  }

  @action
  void changePage(newPage) {
    playersInPage = filteredPlayers.sublist((newPage - 1) * pageSize,
        min(filteredPlayers.length, newPage * pageSize));
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

  @action
  void onChangedSearchPlayerField(String name) {
    searchField = _normalizeString(name);
    applyFilter();
  }

  @action
  void onChangedMinPrice(String price) {
    if (price.isEmpty) {
      maxPrice = 200;
      applyFilter();
      return;
    }
    if (price[price.length - 1] == '.') {
      price = price.substring(0, price.length - 1);
    }
    double parse = double.tryParse(price) ?? 0.0;
    minPrice = (parse * 10).round();

    applyFilter();
  }

  @action
  void onChangedMaxPrice(String price) {
    if (price.isEmpty) {
      maxPrice = 200;
      applyFilter();
      return;
    }
    if (price[price.length - 1] == '.') {
      price = price.substring(0, price.length - 1);
    }
    double parse = double.tryParse(price) ?? 0.0;
    maxPrice = (parse * 10).round();

    applyFilter();
  }

  @action
  void applyFilter() {
    List<Player> newfilteredPlayers = players.data!;
    newfilteredPlayers = newfilteredPlayers
        .where((player) =>
            _normalizeString(player.fullName).contains(searchField) ||
            _normalizeString(player.displayName).contains(searchField))
        .toList();
    newfilteredPlayers = newfilteredPlayers
        .where((player) => minPrice <= player.price && player.price <= maxPrice)
        .toList();

    currentPage = 1;
    totalPage = (newfilteredPlayers.length / pageSize).ceil();
    playersInPage =
        newfilteredPlayers.sublist(0, min(pageSize, newfilteredPlayers.length));
    filteredPlayers = newfilteredPlayers;
  }

  String _normalizeString(String str) {
    str = removeDiacritics(str);
    str = str.toLowerCase();
    str = str.replaceAll(" ", "");
    return str;
  }
}
