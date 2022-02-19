// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_page.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ActivePageStore on _ActivePageStore, Store {
  final _$activePageAtom = Atom(name: '_ActivePageStore.activePage');

  @override
  String get activePage {
    _$activePageAtom.reportRead();
    return super.activePage;
  }

  @override
  set activePage(String value) {
    _$activePageAtom.reportWrite(value, super.activePage, () {
      super.activePage = value;
    });
  }

  final _$_ActivePageStoreActionController =
      ActionController(name: '_ActivePageStore');

  @override
  void changeActivePage(dynamic newPage) {
    final _$actionInfo = _$_ActivePageStoreActionController.startAction(
        name: '_ActivePageStore.changeActivePage');
    try {
      return super.changeActivePage(newPage);
    } finally {
      _$_ActivePageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
activePage: ${activePage}
    ''';
  }
}
