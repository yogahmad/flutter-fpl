import 'package:flutter/material.dart';
import 'package:fpl/components/select_player_dialog.dart';
import 'package:fpl/configs/colors.dart';
import 'package:fpl/configs/positions.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          const Text(
            "Pick Team",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 24.0,
            ),
          ),
          const SizedBox(height: 35.0),
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
                    child: Center(
                      child: Text(
                        Positions.gk,
                        style: const TextStyle(
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
                      _TableItem(
                        context: context,
                        teamName: "Arsenal",
                        fixtures: "BRE(H) + WOL(H)",
                        playerName: "Ramsdale",
                        position: Positions.gk,
                        predictedPoints: 10.2,
                        price: 5.1,
                      ),
                    ],
                  ),
                  const SizedBox(height: 18.0),
                  _addPlayerButton(context, Positions.def),
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
                    child: Center(
                      child: Text(
                        Positions.def,
                        style: const TextStyle(
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
                      _TableItem(
                        context: context,
                        teamName: "Liverpool",
                        fixtures: "NOR(H) + LEE(H)",
                        playerName: "Alexander-Arnold",
                        position: Positions.def,
                        predictedPoints: 12.2,
                        price: 8.5,
                      ),
                      _generateSpacing(10.0, 6),
                      _TableItem(
                        context: context,
                        teamName: "Liverpool",
                        fixtures: "NOR(H) + LEE(H)",
                        playerName: "Robertson",
                        position: Positions.def,
                        predictedPoints: 10.8,
                        price: 7.1,
                      ),
                      _generateSpacing(10.0, 6),
                      _TableItem(
                        context: context,
                        teamName: "Arsenal",
                        fixtures: "BRE(H) + WOL(H)",
                        playerName: "Tierney",
                        position: Positions.def,
                        predictedPoints: 9.6,
                        price: 5.1,
                      ),
                      _generateSpacing(10.0, 6),
                      _TableItem(
                        context: context,
                        teamName: "Brighton",
                        fixtures: "BUR (H)",
                        playerName: "Cucurella",
                        position: Positions.def,
                        predictedPoints: 3.6,
                        price: 5.1,
                      ),
                      _generateSpacing(10.0, 6),
                      _TableItem(
                        context: context,
                        teamName: "Man City",
                        fixtures: "TOT(H)",
                        playerName: "Cancelo",
                        position: Positions.def,
                        predictedPoints: 5.2,
                        price: 7.5,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _addPlayerButton(context, position) {
  return Center(
    child: InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return SelectPlayerDialog(context: context, position: position);
          },
        );
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
          children: [
            Icon(
              Icons.add,
              color: ThemeColors.white,
            ),
            const SizedBox(width: 10.0),
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
  final String position;
  final String playerName;
  final double price;
  final String fixtures;
  final double predictedPoints;
  final BuildContext context;
  final String teamName;

  _TableItem({
    required this.context,
    required this.position,
    required this.playerName,
    required this.price,
    required this.fixtures,
    required this.predictedPoints,
    required this.teamName,
  }) : super(
          decoration: BoxDecoration(
            color: ThemeColors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),
          children: [
            Text(
              teamName,
              style: const TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              playerName,
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
                Text("$price"),
              ],
            ),
            Text(fixtures),
            Text("$predictedPoints"),
            Align(
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return SelectPlayerDialog(
                          context: context, position: position);
                    },
                  );
                },
                child: Icon(
                  Icons.compare_arrows,
                  size: 36.0,
                  color: ThemeColors.main,
                ),
              ),
            ),
          ],
        );
}

Widget _generateHeader(position) {
  return Container(
    width: 85.0,
    height: 35.0,
    margin: const EdgeInsets.symmetric(vertical: 10.0).copyWith(
      left: 10.0,
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(22.5),
      color: _getColorFromPosisiton(position),
    ),
    child: Center(
      child: Text(
        position,
        style: const TextStyle(
          fontWeight: FontWeight.w700,
        ),
      ),
    ),
  );
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
