import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fpl/components/select_player_dialog.dart';
import 'package:fpl/configs/positions.dart';
import 'package:fpl/models/player.dart';
import 'package:fpl/models/response_status.dart';
import 'package:fpl/stores/gameweek_store.dart';
import 'package:fpl/stores/select_player.dart';
import 'package:fpl/stores/selected_team.dart';
import 'package:provider/provider.dart';

import '../configs/colors.dart';

class PickTeam extends StatelessWidget {
  const PickTeam({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<SelectedTeamStore>(context);

    return Observer(builder: (_) {
      if (!store.isFull) {
        return const Center(
          child: Text(
            "Please select 15 Players in Base Team",
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        );
      }
      return ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          scrollbars: false,
        ),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Pick Team",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 24.0,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: store.goToPrevGameweek,
                      icon: const Icon(Icons.arrow_back_ios),
                    ),
                    Text(
                      "Gameweek ${store.currentGameweek}",
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 24.0,
                      ),
                    ),
                    IconButton(
                      onPressed: store.goToNextGameweek,
                      icon: const Icon(Icons.arrow_forward_ios),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 35.0),
            Wrap(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 900.0,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: ThemeColors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Starter",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18.0,
                                ),
                              ),
                              const SizedBox(height: 20.0),
                              Table(
                                defaultVerticalAlignment:
                                    TableCellVerticalAlignment.middle,
                                columnWidths: const {
                                  0: FixedColumnWidth(40.0),
                                  1: FixedColumnWidth(80.0),
                                  3: FixedColumnWidth(80.0),
                                  4: FixedColumnWidth(200.0),
                                  5: FixedColumnWidth(150.0),
                                  6: FixedColumnWidth(80.0),
                                },
                                children: [
                                  const TableRow(
                                    children: [
                                      Text(""),
                                      Center(child: Text("Info")),
                                      Text("Player Name"),
                                      Text("Price"),
                                      Text("Fixtures"),
                                      Text("Predicted Points"),
                                      Center(child: Text("Actions")),
                                    ],
                                  ),
                                  _generateSpacing(12.0, 7),
                                  ...store.starters
                                      .map(
                                        (player) => _TableItem(
                                          player: player,
                                          isStarter: true,
                                          substitutePlayer:
                                              store.substitutePlayer,
                                          gameweek: store.currentGameweek,
                                          isSelected:
                                              store.substitutedPlayer == player,
                                          isSubstitutionValid:
                                              store.isValidAsASubstitution[
                                                  player.fplId]!,
                                        ),
                                      )
                                      .toList(),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    SizedBox(
                      width: 900.0,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: ThemeColors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Bench",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18.0,
                                ),
                              ),
                              const SizedBox(height: 20.0),
                              Table(
                                defaultVerticalAlignment:
                                    TableCellVerticalAlignment.middle,
                                columnWidths: const {
                                  0: FixedColumnWidth(40.0),
                                  1: FixedColumnWidth(80.0),
                                  3: FixedColumnWidth(80.0),
                                  4: FixedColumnWidth(200.0),
                                  5: FixedColumnWidth(150.0),
                                  6: FixedColumnWidth(80.0),
                                },
                                children: [
                                  const TableRow(
                                    children: [
                                      Text(""),
                                      Center(child: Text("Info")),
                                      Text("Player Name"),
                                      Text("Price"),
                                      Text("Fixtures"),
                                      Text("Predicted Points"),
                                      Center(child: Text("Actions")),
                                    ],
                                  ),
                                  _generateSpacing(12.0, 7),
                                  ...store.bench
                                      .map(
                                        (player) => _TableItem(
                                          player: player,
                                          isStarter: false,
                                          substitutePlayer:
                                              store.substitutePlayer,
                                          gameweek: store.currentGameweek,
                                          isSelected:
                                              store.substitutedPlayer == player,
                                          isSubstitutionValid:
                                              store.isValidAsASubstitution[
                                                  player.fplId]!,
                                        ),
                                      )
                                      .toList(),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: _TransferList(),
                ),
              ],
            ),
            const SizedBox(height: 30.0),
          ],
        ),
      );
    });
  }
}

class _TableItem extends TableRow {
  final Player player;
  final bool isStarter;
  final bool isSelected;
  final Function(Player) substitutePlayer;
  final bool isSubstitutionValid;
  final int gameweek;

  _TableItem({
    required this.player,
    required this.isStarter,
    required this.substitutePlayer,
    required this.gameweek,
    this.isSelected = false,
    this.isSubstitutionValid = true,
  }) : super(
          children: [
            Container(
              color: _getColorFromPosisiton(player.position),
              child: const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 12.0,
                ),
                child: Text(""),
              ),
            ),
            const Center(
              child: Icon(
                Icons.info_rounded,
                color: ThemeColors.main,
              ),
            ),
            Text(
              player.displayName,
              style: TextStyle(
                fontSize: 16.0,
                color: isSelected ? ThemeColors.main : null,
              ),
            ),
            Row(
              children: [
                const Icon(
                  Icons.attach_money,
                  color: Colors.green,
                  size: 16.0,
                ),
                Text((player.price / 10).toStringAsFixed(1)),
              ],
            ),
            _FixtureWidget(
              gameweek: gameweek,
              player: player,
            ),
            const Text("Predicted Points"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: isSubstitutionValid
                      ? () {
                          substitutePlayer(player);
                        }
                      : null,
                  icon: Icon(
                    isStarter ? Icons.arrow_downward : Icons.arrow_upward,
                    color: isSubstitutionValid
                        ? isSelected
                            ? ThemeColors.main
                            : null
                        : Colors.transparent,
                  ),
                ),
                _SubstitutePlayerButton(player: player),
              ],
            ),
          ],
        );
}

class _TransferList extends StatelessWidget {
  const _TransferList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<SelectedTeamStore>(context);

    return Observer(builder: (_) {
      return SizedBox(
        width: 400.0,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: ThemeColors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Transfers",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18.0,
                  ),
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Player out
                    Column(
                      children: store.transfers
                          .map(
                            (transfer) => Padding(
                              padding: EdgeInsets.only(bottom: 12.0),
                              child: Text(
                                transfer.playerOut.displayName,
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    // Icon
                    Column(
                      children: store.transfers
                          .map(
                            (transfer) => Padding(
                              padding: EdgeInsets.only(bottom: 12.0),
                              child: Icon(
                                Icons.compare_arrows,
                                color: ThemeColors.red,
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    // Player in
                    Column(
                      children: store.transfers
                          .map(
                            (transfer) => Padding(
                              padding: EdgeInsets.only(bottom: 12.0),
                              child: Text(
                                transfer.playerIn.displayName,
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

class _SubstitutePlayerButton extends StatelessWidget {
  const _SubstitutePlayerButton({
    Key? key,
    required this.player,
  }) : super(key: key);

  final Player player;

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<SelectPlayerStore>(context);
    final teamStore = Provider.of<SelectedTeamStore>(context);

    return IconButton(
      onPressed: () async {
        store.fetchAllTeams();
        String position = player.position;

        if (position == Positions.gk) {
          store.fetchGoalkeeper();
        } else if (position == Positions.def) {
          store.fetchDefender();
        } else if (position == Positions.mid) {
          store.fetchMidfielder();
        } else if (position == Positions.fwd) {
          store.fetchForward();
        } else {
          store.fetchAllPlayer();
        }
        Player? addedPlayer = await showDialog(
          context: context,
          builder: (context) {
            return SelectPlayerDialog(
              context: context,
              position: position,
            );
          },
        );
        if (addedPlayer != null) {
          teamStore.transferPlayer(addedPlayer, player);
        }
      },
      icon: const Icon(
        Icons.compare_arrows,
        color: ThemeColors.red,
      ),
    );
  }
}

class _FixtureWidget extends StatelessWidget {
  const _FixtureWidget({
    Key? key,
    required this.player,
    required this.gameweek,
  }) : super(key: key);

  final Player player;
  final int gameweek;

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<GameweekStore>(context);

    return Observer(builder: (_) {
      if (store.gameweeks.status == ResponseStatus.loading) {
        return Container();
      }
      return Row(
        children: store
            .getFixture(player.teamId, gameweek)
            .map(
              (data) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6.0),
                child: Container(
                  width: 56.0,
                  height: 25.0,
                  color: player.position == Positions.gk ||
                          player.position == Positions.def
                      ? data.item2
                      : data.item3,
                  child: Center(
                    child: Text(
                      data.item4 ? data.item1 : data.item1.toLowerCase(),
                      style: const TextStyle(fontSize: 16.0),
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      );
    });
  }
}

Color _getColorFromPosisiton(position) {
  if (position == Positions.gk) {
    return ThemeColors.goalkeeperYellow;
  } else if (position == Positions.def) {
    return ThemeColors.defenderGreen;
  } else if (position == Positions.mid) {
    return ThemeColors.midfielderBlue;
  } else {
    return ThemeColors.forwardRed;
  }
}

TableRow _generateSpacing(space, numberOfRow) {
  return TableRow(
    children: List.generate(
      numberOfRow,
      (_) => SizedBox(height: space),
    ),
  );
}
