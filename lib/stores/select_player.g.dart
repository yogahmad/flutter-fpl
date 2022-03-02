// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'select_player.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SelectPlayerStore on _SelectPlayerStore, Store {
  final _$currentPageAtom = Atom(name: '_SelectPlayerStore.currentPage');

  @override
  int get currentPage {
    _$currentPageAtom.reportRead();
    return super.currentPage;
  }

  @override
  set currentPage(int value) {
    _$currentPageAtom.reportWrite(value, super.currentPage, () {
      super.currentPage = value;
    });
  }

  final _$totalPageAtom = Atom(name: '_SelectPlayerStore.totalPage');

  @override
  int get totalPage {
    _$totalPageAtom.reportRead();
    return super.totalPage;
  }

  @override
  set totalPage(int value) {
    _$totalPageAtom.reportWrite(value, super.totalPage, () {
      super.totalPage = value;
    });
  }

  final _$playersAtom = Atom(name: '_SelectPlayerStore.players');

  @override
  Response<List<Player>> get players {
    _$playersAtom.reportRead();
    return super.players;
  }

  @override
  set players(Response<List<Player>> value) {
    _$playersAtom.reportWrite(value, super.players, () {
      super.players = value;
    });
  }

  final _$teamsAtom = Atom(name: '_SelectPlayerStore.teams');

  @override
  Response<List<Team>> get teams {
    _$teamsAtom.reportRead();
    return super.teams;
  }

  @override
  set teams(Response<List<Team>> value) {
    _$teamsAtom.reportWrite(value, super.teams, () {
      super.teams = value;
    });
  }

  final _$playersInPageAtom = Atom(name: '_SelectPlayerStore.playersInPage');

  @override
  List<Player> get playersInPage {
    _$playersInPageAtom.reportRead();
    return super.playersInPage;
  }

  @override
  set playersInPage(List<Player> value) {
    _$playersInPageAtom.reportWrite(value, super.playersInPage, () {
      super.playersInPage = value;
    });
  }

  final _$selectedTeamAtom = Atom(name: '_SelectPlayerStore.selectedTeam');

  @override
  ObservableList<bool> get selectedTeam {
    _$selectedTeamAtom.reportRead();
    return super.selectedTeam;
  }

  @override
  set selectedTeam(ObservableList<bool> value) {
    _$selectedTeamAtom.reportWrite(value, super.selectedTeam, () {
      super.selectedTeam = value;
    });
  }

  final _$fetchAllTeamsAsyncAction =
      AsyncAction('_SelectPlayerStore.fetchAllTeams');

  @override
  Future<void> fetchAllTeams() {
    return _$fetchAllTeamsAsyncAction.run(() => super.fetchAllTeams());
  }

  final _$fetchAllPlayerAsyncAction =
      AsyncAction('_SelectPlayerStore.fetchAllPlayer');

  @override
  Future<void> fetchAllPlayer() {
    return _$fetchAllPlayerAsyncAction.run(() => super.fetchAllPlayer());
  }

  final _$fetchGoalkeeperAsyncAction =
      AsyncAction('_SelectPlayerStore.fetchGoalkeeper');

  @override
  Future<void> fetchGoalkeeper() {
    return _$fetchGoalkeeperAsyncAction.run(() => super.fetchGoalkeeper());
  }

  final _$fetchDefenderAsyncAction =
      AsyncAction('_SelectPlayerStore.fetchDefender');

  @override
  Future<void> fetchDefender() {
    return _$fetchDefenderAsyncAction.run(() => super.fetchDefender());
  }

  final _$fetchMidfielderAsyncAction =
      AsyncAction('_SelectPlayerStore.fetchMidfielder');

  @override
  Future<void> fetchMidfielder() {
    return _$fetchMidfielderAsyncAction.run(() => super.fetchMidfielder());
  }

  final _$fetchForwardAsyncAction =
      AsyncAction('_SelectPlayerStore.fetchForward');

  @override
  Future<void> fetchForward() {
    return _$fetchForwardAsyncAction.run(() => super.fetchForward());
  }

  final _$_SelectPlayerStoreActionController =
      ActionController(name: '_SelectPlayerStore');

  @override
  void toggleSelectedTeam(int index) {
    final _$actionInfo = _$_SelectPlayerStoreActionController.startAction(
        name: '_SelectPlayerStore.toggleSelectedTeam');
    try {
      return super.toggleSelectedTeam(index);
    } finally {
      _$_SelectPlayerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changePage(dynamic newPage) {
    final _$actionInfo = _$_SelectPlayerStoreActionController.startAction(
        name: '_SelectPlayerStore.changePage');
    try {
      return super.changePage(newPage);
    } finally {
      _$_SelectPlayerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void nextPage() {
    final _$actionInfo = _$_SelectPlayerStoreActionController.startAction(
        name: '_SelectPlayerStore.nextPage');
    try {
      return super.nextPage();
    } finally {
      _$_SelectPlayerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void prevPage() {
    final _$actionInfo = _$_SelectPlayerStoreActionController.startAction(
        name: '_SelectPlayerStore.prevPage');
    try {
      return super.prevPage();
    } finally {
      _$_SelectPlayerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onChangedSearchPlayerField(String name) {
    final _$actionInfo = _$_SelectPlayerStoreActionController.startAction(
        name: '_SelectPlayerStore.onChangedSearchPlayerField');
    try {
      return super.onChangedSearchPlayerField(name);
    } finally {
      _$_SelectPlayerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onChangedMinPrice(String price) {
    final _$actionInfo = _$_SelectPlayerStoreActionController.startAction(
        name: '_SelectPlayerStore.onChangedMinPrice');
    try {
      return super.onChangedMinPrice(price);
    } finally {
      _$_SelectPlayerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onChangedMaxPrice(String price) {
    final _$actionInfo = _$_SelectPlayerStoreActionController.startAction(
        name: '_SelectPlayerStore.onChangedMaxPrice');
    try {
      return super.onChangedMaxPrice(price);
    } finally {
      _$_SelectPlayerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void applyFilter() {
    final _$actionInfo = _$_SelectPlayerStoreActionController.startAction(
        name: '_SelectPlayerStore.applyFilter');
    try {
      return super.applyFilter();
    } finally {
      _$_SelectPlayerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentPage: ${currentPage},
totalPage: ${totalPage},
players: ${players},
teams: ${teams},
playersInPage: ${playersInPage},
selectedTeam: ${selectedTeam}
    ''';
  }
}
