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

  final _$fetchAllPlayerAsyncAction =
      AsyncAction('_SelectPlayerStore.fetchAllPlayer');

  @override
  Future<void> fetchAllPlayer() {
    return _$fetchAllPlayerAsyncAction.run(() => super.fetchAllPlayer());
  }

  final _$_SelectPlayerStoreActionController =
      ActionController(name: '_SelectPlayerStore');

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
  String toString() {
    return '''
currentPage: ${currentPage},
totalPage: ${totalPage},
players: ${players}
    ''';
  }
}
