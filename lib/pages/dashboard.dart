import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fpl/components/select_player_dialog.dart';
import 'package:fpl/configs/colors.dart';
import 'package:fpl/configs/positions.dart';
import 'package:fpl/models/player.dart';
import 'package:fpl/stores/select_player.dart';
import 'package:fpl/stores/selected_team.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<SelectedTeamStore>(context);

    return Observer(
      builder: (_) => ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          scrollbars: false,
        ),
        child: ListView(
          children: [
            const Text(
              "Select Base Team",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 24.0,
              ),
            ),
            const SizedBox(height: 35.0),
            Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                width: 900.0,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: ThemeColors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 160,
                              height: 32.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: _getColorFromPosisiton(Positions.gk),
                              ),
                              child: const Center(
                                child: Text(
                                  Positions.gk,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20.0),
                            _generateTable(
                              children: [
                                const TableRow(
                                  children: [
                                    Text("Team"),
                                    Text("Player Name"),
                                    Text("Price"),
                                    Text("Fixtures"),
                                    Text("Predicted Points"),
                                    Text("Actions"),
                                  ],
                                ),
                                _generateSpacing(18.0, 6),
                                ...List.generate(
                                  store.goalkeepers.length,
                                  (index) => _TableItem(
                                    context: context,
                                    fixtures: "",
                                    player: store.goalkeepers[index],
                                  ),
                                ),
                              ],
                            ),
                            if (!store.isGkFull) ...[
                              const SizedBox(height: 18.0),
                              const _AddPlayerButton(position: Positions.gk),
                            ],
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: ThemeColors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 160,
                              height: 32.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: _getColorFromPosisiton(Positions.def),
                              ),
                              child: const Center(
                                child: Text(
                                  Positions.def,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20.0),
                            _generateTable(
                              children: [
                                const TableRow(
                                  children: [
                                    Text("Team"),
                                    Text("Player Name"),
                                    Text("Price"),
                                    Text("Fixtures"),
                                    Text("Predicted Points"),
                                    Text("Actions"),
                                  ],
                                ),
                                _generateSpacing(18.0, 6),
                                ...List.generate(
                                  store.defenders.length,
                                  (index) => _TableItem(
                                    context: context,
                                    fixtures: "",
                                    player: store.defenders[index],
                                  ),
                                ),
                              ],
                            ),
                            if (!store.isDefFull) ...[
                              const SizedBox(height: 18.0),
                              const _AddPlayerButton(position: Positions.def),
                            ],
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: ThemeColors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 160,
                              height: 32.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: _getColorFromPosisiton(Positions.mid),
                              ),
                              child: const Center(
                                child: Text(
                                  Positions.mid,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20.0),
                            _generateTable(
                              children: [
                                const TableRow(
                                  children: [
                                    Text("Team"),
                                    Text("Player Name"),
                                    Text("Price"),
                                    Text("Fixtures"),
                                    Text("Predicted Points"),
                                    Text("Actions"),
                                  ],
                                ),
                                _generateSpacing(18.0, 6),
                                ...List.generate(
                                  store.midfielders.length,
                                  (index) => _TableItem(
                                    context: context,
                                    fixtures: "",
                                    player: store.midfielders[index],
                                  ),
                                ),
                              ],
                            ),
                            if (!store.isMidFull) ...[
                              const SizedBox(height: 18.0),
                              const _AddPlayerButton(position: Positions.mid),
                            ],
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: ThemeColors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 160,
                              height: 32.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: _getColorFromPosisiton(Positions.fwd),
                              ),
                              child: const Center(
                                child: Text(
                                  Positions.fwd,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20.0),
                            _generateTable(
                              children: [
                                const TableRow(
                                  children: [
                                    Text("Team"),
                                    Text("Player Name"),
                                    Text("Price"),
                                    Text("Fixtures"),
                                    Text("Predicted Points"),
                                    Text("Actions"),
                                  ],
                                ),
                                _generateSpacing(18.0, 6),
                                ...List.generate(
                                  store.forwards.length,
                                  (index) => _TableItem(
                                    context: context,
                                    fixtures: "",
                                    player: store.forwards[index],
                                  ),
                                ),
                              ],
                            ),
                            if (!store.isFwdFull) ...[
                              const SizedBox(height: 18.0),
                              const _AddPlayerButton(position: Positions.fwd),
                            ],
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AddPlayerButton extends StatelessWidget {
  const _AddPlayerButton({
    Key? key,
    required this.position,
  }) : super(key: key);
  final String position;

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<SelectPlayerStore>(context);
    final teamStore = Provider.of<SelectedTeamStore>(context);

    return Observer(
      builder: (_) {
        return Center(
          child: InkWell(
            onTap: () async {
              store.fetchAllTeams();
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
              Player? player = await showDialog(
                context: context,
                builder: (context) {
                  return SelectPlayerDialog(
                    context: context,
                    position: position,
                  );
                },
              );
              if (player != null) {
                teamStore.addPlayer(player, player.position);
              }
            },
            child: Container(
              width: 160,
              height: 32.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: ThemeColors.main,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.add,
                    color: ThemeColors.white,
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    "Add a Player",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: ThemeColors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

Table _generateTable({children}) {
  return Table(
    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
    columnWidths: const {
      0: FixedColumnWidth(150.0),
      2: FixedColumnWidth(80.0),
      3: FixedColumnWidth(160.0),
      4: FixedColumnWidth(150.0),
      5: FixedColumnWidth(80.0),
    },
    children: children,
  );
}

class _TableItem extends TableRow {
  final BuildContext context;
  final Player player;
  final String fixtures;

  _TableItem({
    required this.context,
    required this.player,
    required this.fixtures,
  }) : super(
          decoration: BoxDecoration(
            color: ThemeColors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),
          children: [
            Text(
              player.team,
              style: const TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              player.displayName,
              style: const TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
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
            Text(fixtures),
            const Text("0.0"),
            _SubstitutePlayerButton(
              position: player.position,
              player: player,
            )
          ],
        );
}

class _SubstitutePlayerButton extends StatelessWidget {
  const _SubstitutePlayerButton({
    Key? key,
    required this.position,
    required this.player,
  }) : super(key: key);

  final String position;
  final Player player;

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<SelectPlayerStore>(context);
    final teamStore = Provider.of<SelectedTeamStore>(context);

    return Align(
      alignment: Alignment.centerLeft,
      child: InkWell(
        onTap: () async {
          store.fetchAllTeams();
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
            teamStore.removePlayer(player);
            teamStore.addPlayer(addedPlayer, addedPlayer.position);
          }
        },
        child: const Icon(
          Icons.compare_arrows,
          size: 36.0,
          color: ThemeColors.main,
        ),
      ),
    );
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
