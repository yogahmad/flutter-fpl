import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fpl/configs/positions.dart';
import 'package:fpl/models/player.dart';
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
      return ListView(
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
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_back_ios),
                  ),
                  const Text(
                    "Gameweek 28",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 24.0,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_forward_ios),
                  ),
                ],
              ),
            ],
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
                          const Text(
                            "Starter",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
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
                              4: FixedColumnWidth(160.0),
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
                                      substitutePlayer: store.substitutePlayer,
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
                ],
              ),
            ),
          ),
          const SizedBox(height: 10.0),
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
                          const Text(
                            "Bench",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
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
                              4: FixedColumnWidth(160.0),
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
                                      substitutePlayer: store.substitutePlayer,
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
                  const SizedBox(height: 30.0),
                ],
              ),
            ),
          ),
        ],
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

  _TableItem({
    required this.player,
    required this.isStarter,
    required this.substitutePlayer,
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
                // fontWeight: FontWeight.bold,
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
            Text("Fixtures"),
            Text("Predicted Points"),
            isSubstitutionValid
                ? IconButton(
                    onPressed: () {
                      substitutePlayer(player);
                    },
                    icon: Icon(
                      isStarter ? Icons.arrow_downward : Icons.arrow_upward,
                      color: isSelected ? ThemeColors.main : null,
                    ),
                  )
                : Container(),
          ],
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

TableRow _generateSpacing(space, numberOfRow) {
  return TableRow(
    children: List.generate(
      numberOfRow,
      (_) => SizedBox(height: space),
    ),
  );
}
