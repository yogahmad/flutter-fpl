import 'package:flutter/material.dart';
import 'package:fpl/components/pagination.dart';

import '../configs/colors.dart';

class SelectPlayerDialog extends AlertDialog {
  final String position;
  final BuildContext context;

  SelectPlayerDialog({
    Key? key,
    required this.context,
    required this.position,
  }) : super(
          key: key,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Select a $position",
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(20.0),
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 40.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: ThemeColors.lightOrange,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.close,
                      color: ThemeColors.red,
                    ),
                  ),
                ),
              ),
            ],
          ),
          content: _SelectPlayerDialogContent(),
        );
}

class _SelectPlayerDialogContent extends StatefulWidget {
  _SelectPlayerDialogContent({Key? key}) : super(key: key);

  @override
  State<_SelectPlayerDialogContent> createState() =>
      __SelectPlayerDialogContentState();
}

class __SelectPlayerDialogContentState
    extends State<_SelectPlayerDialogContent> {
  int page = 7;
  int currentPage = 1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1200.0,
      height: 600.0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _PlayerFilter(),
          SizedBox(width: 10.0),
          VerticalDivider(),
          SizedBox(width: 10.0),
          Expanded(
            child: Column(
              children: [
                Table(
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  columnWidths: const {
                    0: FixedColumnWidth(150.0),
                    2: FixedColumnWidth(80.0),
                    3: FixedColumnWidth(160.0),
                    4: FixedColumnWidth(150.0),
                    5: FixedColumnWidth(80.0),
                  },
                  children: [
                    TableRow(
                      children: [
                        Text("Team"),
                        Text("Player Name"),
                        Text("Price"),
                        Text("Fixtures"),
                        Text("Predicted Points"),
                        Text("Actions"),
                      ],
                    ),
                    _generateSpacing(10.0, 6),
                    _TableItem(
                      context: context,
                      teamName: "Man City",
                      fixtures: "TOT(H)",
                      playerName: "Cancelo",
                      predictedPoints: 5.2,
                      price: 7.5,
                    ),
                    _generateSpacing(10.0, 6),
                    _TableItem(
                      context: context,
                      teamName: "Man City",
                      fixtures: "TOT(H)",
                      playerName: "Cancelo",
                      predictedPoints: 5.2,
                      price: 7.5,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Pagination(
                  changePage: (newPage) {
                    setState(() {
                      currentPage = newPage;
                    });
                  },
                  currentPage: currentPage,
                  page: page,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PlayerFilter extends StatelessWidget {
  const _PlayerFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 240,
      child: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Filters",
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10.0),
          TextField(
            style: const TextStyle(fontSize: 14.0),
            decoration: InputDecoration(
              hintText: "Search a Player...",
              prefixIcon: Icon(
                Icons.search,
                size: 16.0,
                color: ThemeColors.main,
              ),
              isDense: true,
              contentPadding: const EdgeInsets.all(10.0),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.0),
                borderSide: const BorderSide(
                  color: Color(0xFFD8DEE7),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.0),
                borderSide: const BorderSide(
                  color: Color(0xFFD8DEE7),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          const Divider(),
          const Text("Price", style: TextStyle(fontSize: 14.0)),
          const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 100.0,
                child: TextField(
                  style: const TextStyle(fontSize: 14.0),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "3.0",
                    isDense: true,
                    contentPadding: const EdgeInsets.all(10.0),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide: const BorderSide(
                        color: Color(0xFFD8DEE7),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide: const BorderSide(
                        color: Color(0xFFD8DEE7),
                      ),
                    ),
                  ),
                ),
              ),
              const Text("-"),
              SizedBox(
                width: 100.0,
                child: TextField(
                  style: const TextStyle(fontSize: 14.0),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "15.0",
                    isDense: true,
                    contentPadding: const EdgeInsets.all(10.0),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide: const BorderSide(
                        color: Color(0xFFD8DEE7),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide: const BorderSide(
                        color: Color(0xFFD8DEE7),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          const Divider(),
          const Text("Teams", style: TextStyle(fontSize: 14.0)),
          const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Transform.scale(
                        scale: 0.8,
                        child: Checkbox(
                          activeColor: ThemeColors.main,
                          value: true,
                          onChanged: (selected) {},
                        ),
                      ),
                      const Text(
                        "Arsenal",
                        style: TextStyle(fontSize: 14.0),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Transform.scale(
                        scale: 0.8,
                        child: Checkbox(
                          activeColor: ThemeColors.main,
                          value: true,
                          onChanged: (selected) {},
                        ),
                      ),
                      const Text(
                        "Brighton",
                        style: TextStyle(fontSize: 14.0),
                      )
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Transform.scale(
                        scale: 0.8,
                        child: Checkbox(
                          activeColor: ThemeColors.main,
                          value: true,
                          onChanged: (selected) {},
                        ),
                      ),
                      const Text(
                        "Man City",
                        style: TextStyle(fontSize: 14.0),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Transform.scale(
                        scale: 0.8,
                        child: Checkbox(
                          activeColor: ThemeColors.main,
                          value: true,
                          onChanged: (selected) {},
                        ),
                      ),
                      const Text(
                        "Man Utd",
                        style: TextStyle(fontSize: 14.0),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Transform.scale(
                        scale: 0.8,
                        child: Checkbox(
                          activeColor: ThemeColors.main,
                          value: true,
                          onChanged: (selected) {},
                        ),
                      ),
                      const Text(
                        "Southampthon",
                        style: TextStyle(fontSize: 14.0),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TableItem extends TableRow {
  final String playerName;
  final double price;
  final String fixtures;
  final double predictedPoints;
  final BuildContext context;
  final String teamName;

  _TableItem({
    required this.context,
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
                onTap: () {},
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 24.0,
                  color: ThemeColors.main,
                ),
              ),
            ),
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
