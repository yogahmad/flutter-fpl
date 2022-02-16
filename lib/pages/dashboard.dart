import 'package:flutter/material.dart';
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
          Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            columnWidths: const {
              0: FixedColumnWidth(150.0),
              2: FixedColumnWidth(120.0),
              3: FixedColumnWidth(225.0),
              4: FixedColumnWidth(225.0),
              5: FixedColumnWidth(300.0),
            },
            children: [
              const TableRow(
                children: [
                  Text("Position"),
                  Text("Player Name"),
                  Text("Price"),
                  Text("Fixtures"),
                  Text("Predicted Points"),
                  Text("Actions"),
                ],
              ),
              _generateSpacing(18.0, 6),
              _TableItem(
                actions: "Captain, Vice Captain, Substitute",
                fixtures: "BRE(H) + WOL(H)",
                playerName: "Ramsdale",
                position: Positions.gk,
                predictedPoints: 10.2,
                price: 5.1,
              ),
              _generateSpacing(10.0, 6),
              _TableItem(
                actions: "Captain, Vice Captain, Substitute",
                fixtures: "NOR(H) + LEE(H)",
                playerName: "Alexander-Arnold",
                position: Positions.def,
                predictedPoints: 12.2,
                price: 8.5,
              ),
              _generateSpacing(10.0, 6),
              _TableItem(
                actions: "Captain, Vice Captain, Substitute",
                fixtures: "NOR(H) + LEE(H)",
                playerName: "Alexander-Arnold",
                position: Positions.def,
                predictedPoints: 12.2,
                price: 8.5,
              ),
              _generateSpacing(10.0, 6),
              _TableItem(
                actions: "Captain, Vice Captain, Substitute",
                fixtures: "NOR(H) + LEE(H)",
                playerName: "Alexander-Arnold",
                position: Positions.def,
                predictedPoints: 12.2,
                price: 8.5,
              ),
              _generateSpacing(10.0, 6),
              _TableItem(
                actions: "Captain, Vice Captain, Substitute",
                fixtures: "NOR(H) + LEE(H)",
                playerName: "Alexander-Arnold",
                position: Positions.def,
                predictedPoints: 12.2,
                price: 8.5,
              ),
              _generateSpacing(10.0, 6),
              _TableItem(
                actions: "Captain, Vice Captain, Substitute",
                fixtures: "NEW(H)",
                playerName: "Bowen",
                position: Positions.mid,
                predictedPoints: 8.2,
                price: 7.0,
              ),
              _generateSpacing(10.0, 6),
              _TableItem(
                actions: "Captain, Vice Captain, Substitute",
                fixtures: "NEW(H)",
                playerName: "Bowen",
                position: Positions.mid,
                predictedPoints: 8.2,
                price: 7.0,
              ),
              _generateSpacing(10.0, 6),
              _TableItem(
                actions: "Captain, Vice Captain, Substitute",
                fixtures: "NEW(H)",
                playerName: "Bowen",
                position: Positions.mid,
                predictedPoints: 8.2,
                price: 7.0,
              ),
              _generateSpacing(10.0, 6),
              _TableItem(
                actions: "Captain, Vice Captain, Substitute",
                fixtures: "NEW(H)",
                playerName: "Bowen",
                position: Positions.mid,
                predictedPoints: 8.2,
                price: 7.0,
              ),
              _generateSpacing(10.0, 6),
              _TableItem(
                actions: "Captain, Vice Captain, Substitute",
                fixtures: "SOU(A)",
                playerName: "Calvert-Lewin",
                position: Positions.fwd,
                predictedPoints: 4.2,
                price: 7.9,
              ),
              _generateSpacing(10.0, 6),
              _TableItem(
                actions: "Captain, Vice Captain, Substitute",
                fixtures: "SOU(A)",
                playerName: "Calvert-Lewin",
                position: Positions.fwd,
                predictedPoints: 4.2,
                price: 7.9,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TableItem extends TableRow {
  final String position;
  final String playerName;
  final double price;
  final String fixtures;
  final double predictedPoints;
  final String actions;

  _TableItem({
    required this.position,
    required this.playerName,
    required this.price,
    required this.fixtures,
    required this.predictedPoints,
    required this.actions,
  }) : super(
          decoration: BoxDecoration(
            color: ThemeColors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
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
              ),
            ),
            Text(
              playerName,
              style: const TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
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
            Text(actions),
          ],
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
