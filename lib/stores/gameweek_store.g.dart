// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gameweek_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GameweekStore on _GameweekStore, Store {
  final _$gameweeksAtom = Atom(name: '_GameweekStore.gameweeks');

  @override
  Response<List<Gameweek>> get gameweeks {
    _$gameweeksAtom.reportRead();
    return super.gameweeks;
  }

  @override
  set gameweeks(Response<List<Gameweek>> value) {
    _$gameweeksAtom.reportWrite(value, super.gameweeks, () {
      super.gameweeks = value;
    });
  }

  final _$loadDataAsyncAction = AsyncAction('_GameweekStore.loadData');

  @override
  Future<void> loadData() {
    return _$loadDataAsyncAction.run(() => super.loadData());
  }

  @override
  String toString() {
    return '''
gameweeks: ${gameweeks}
    ''';
  }
}
