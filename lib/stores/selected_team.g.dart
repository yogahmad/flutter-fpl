// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selected_team.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SelectedTeamStore on _SelectedTeamStore, Store {
  Computed<bool>? _$isGkFullComputed;

  @override
  bool get isGkFull =>
      (_$isGkFullComputed ??= Computed<bool>(() => super.isGkFull,
              name: '_SelectedTeamStore.isGkFull'))
          .value;
  Computed<bool>? _$isDefFullComputed;

  @override
  bool get isDefFull =>
      (_$isDefFullComputed ??= Computed<bool>(() => super.isDefFull,
              name: '_SelectedTeamStore.isDefFull'))
          .value;
  Computed<bool>? _$isMidFullComputed;

  @override
  bool get isMidFull =>
      (_$isMidFullComputed ??= Computed<bool>(() => super.isMidFull,
              name: '_SelectedTeamStore.isMidFull'))
          .value;
  Computed<bool>? _$isFwdFullComputed;

  @override
  bool get isFwdFull =>
      (_$isFwdFullComputed ??= Computed<bool>(() => super.isFwdFull,
              name: '_SelectedTeamStore.isFwdFull'))
          .value;
  Computed<bool>? _$isFullComputed;

  @override
  bool get isFull => (_$isFullComputed ??=
          Computed<bool>(() => super.isFull, name: '_SelectedTeamStore.isFull'))
      .value;

  final _$goalkeepersAtom = Atom(name: '_SelectedTeamStore.goalkeepers');

  @override
  ObservableList<Player> get goalkeepers {
    _$goalkeepersAtom.reportRead();
    return super.goalkeepers;
  }

  @override
  set goalkeepers(ObservableList<Player> value) {
    _$goalkeepersAtom.reportWrite(value, super.goalkeepers, () {
      super.goalkeepers = value;
    });
  }

  final _$defendersAtom = Atom(name: '_SelectedTeamStore.defenders');

  @override
  ObservableList<Player> get defenders {
    _$defendersAtom.reportRead();
    return super.defenders;
  }

  @override
  set defenders(ObservableList<Player> value) {
    _$defendersAtom.reportWrite(value, super.defenders, () {
      super.defenders = value;
    });
  }

  final _$midfieldersAtom = Atom(name: '_SelectedTeamStore.midfielders');

  @override
  ObservableList<Player> get midfielders {
    _$midfieldersAtom.reportRead();
    return super.midfielders;
  }

  @override
  set midfielders(ObservableList<Player> value) {
    _$midfieldersAtom.reportWrite(value, super.midfielders, () {
      super.midfielders = value;
    });
  }

  final _$forwardsAtom = Atom(name: '_SelectedTeamStore.forwards');

  @override
  ObservableList<Player> get forwards {
    _$forwardsAtom.reportRead();
    return super.forwards;
  }

  @override
  set forwards(ObservableList<Player> value) {
    _$forwardsAtom.reportWrite(value, super.forwards, () {
      super.forwards = value;
    });
  }

  final _$startersAtom = Atom(name: '_SelectedTeamStore.starters');

  @override
  ObservableList<Player> get starters {
    _$startersAtom.reportRead();
    return super.starters;
  }

  @override
  set starters(ObservableList<Player> value) {
    _$startersAtom.reportWrite(value, super.starters, () {
      super.starters = value;
    });
  }

  final _$benchAtom = Atom(name: '_SelectedTeamStore.bench');

  @override
  ObservableList<Player> get bench {
    _$benchAtom.reportRead();
    return super.bench;
  }

  @override
  set bench(ObservableList<Player> value) {
    _$benchAtom.reportWrite(value, super.bench, () {
      super.bench = value;
    });
  }

  final _$substitutedPlayerAtom =
      Atom(name: '_SelectedTeamStore.substitutedPlayer');

  @override
  Player? get substitutedPlayer {
    _$substitutedPlayerAtom.reportRead();
    return super.substitutedPlayer;
  }

  @override
  set substitutedPlayer(Player? value) {
    _$substitutedPlayerAtom.reportWrite(value, super.substitutedPlayer, () {
      super.substitutedPlayer = value;
    });
  }

  final _$isValidAsASubstitutionAtom =
      Atom(name: '_SelectedTeamStore.isValidAsASubstitution');

  @override
  ObservableMap<int, bool> get isValidAsASubstitution {
    _$isValidAsASubstitutionAtom.reportRead();
    return super.isValidAsASubstitution;
  }

  @override
  set isValidAsASubstitution(ObservableMap<int, bool> value) {
    _$isValidAsASubstitutionAtom
        .reportWrite(value, super.isValidAsASubstitution, () {
      super.isValidAsASubstitution = value;
    });
  }

  final _$removePlayerAsyncAction =
      AsyncAction('_SelectedTeamStore.removePlayer');

  @override
  Future<void> removePlayer(Player player) {
    return _$removePlayerAsyncAction.run(() => super.removePlayer(player));
  }

  final _$addPlayerAsyncAction = AsyncAction('_SelectedTeamStore.addPlayer');

  @override
  Future<void> addPlayer(Player player, String position) {
    return _$addPlayerAsyncAction.run(() => super.addPlayer(player, position));
  }

  final _$_SelectedTeamStoreActionController =
      ActionController(name: '_SelectedTeamStore');

  @override
  void loadStarterBench() {
    final _$actionInfo = _$_SelectedTeamStoreActionController.startAction(
        name: '_SelectedTeamStore.loadStarterBench');
    try {
      return super.loadStarterBench();
    } finally {
      _$_SelectedTeamStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void substitutePlayer(Player player) {
    final _$actionInfo = _$_SelectedTeamStoreActionController.startAction(
        name: '_SelectedTeamStore.substitutePlayer');
    try {
      return super.substitutePlayer(player);
    } finally {
      _$_SelectedTeamStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void verifySubstitutionValidity() {
    final _$actionInfo = _$_SelectedTeamStoreActionController.startAction(
        name: '_SelectedTeamStore.verifySubstitutionValidity');
    try {
      return super.verifySubstitutionValidity();
    } finally {
      _$_SelectedTeamStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
goalkeepers: ${goalkeepers},
defenders: ${defenders},
midfielders: ${midfielders},
forwards: ${forwards},
starters: ${starters},
bench: ${bench},
substitutedPlayer: ${substitutedPlayer},
isValidAsASubstitution: ${isValidAsASubstitution},
isGkFull: ${isGkFull},
isDefFull: ${isDefFull},
isMidFull: ${isMidFull},
isFwdFull: ${isFwdFull},
isFull: ${isFull}
    ''';
  }
}
