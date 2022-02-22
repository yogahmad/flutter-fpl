import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fpl/components/pagination.dart';
import 'package:fpl/configs/decimal_input_formatter.dart';
import 'package:fpl/models/player.dart';
import 'package:fpl/models/response_status.dart';
import 'package:fpl/stores/select_player.dart';
import 'package:provider/provider.dart';

import '../configs/colors.dart';

class SelectPlayerDialog extends AlertDialog {
  final String position;
  final BuildContext context;
  final Player? replacedPlayer;

  SelectPlayerDialog({
    Key? key,
    required this.context,
    required this.position,
    this.replacedPlayer,
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
          content: _SelectPlayerDialogContent(
            position: position,
            replacedPlayer: replacedPlayer,
          ),
        );
}

class _SelectPlayerDialogContent extends StatelessWidget {
  const _SelectPlayerDialogContent({
    Key? key,
    required this.position,
    this.replacedPlayer,
  }) : super(key: key);

  final String position;
  final Player? replacedPlayer;

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<SelectPlayerStore>(context);

    return SizedBox(
      width: 1200.0,
      height: 425.0,
      child: Observer(
        builder: (_) {
          if (store.players.status == ResponseStatus.loading) {
            return Center(
              child: CircularProgressIndicator(
                color: ThemeColors.main,
              ),
            );
          }
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _PlayerFilter(),
              const SizedBox(width: 10.0),
              const SizedBox(width: 10.0),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Table(
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      columnWidths: const {
                        0: FixedColumnWidth(150.0),
                        2: FixedColumnWidth(80.0),
                        3: FixedColumnWidth(160.0),
                        4: FixedColumnWidth(150.0),
                        5: FixedColumnWidth(80.0),
                      },
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
                        ...List<TableRow>.generate(
                          store.playersInPage.length * 2,
                          (index) {
                            if (index % 2 == 0) {
                              return _generateSpacing(10.0, 6);
                            }
                            var id = (index / 2).floor();
                            Player player = store.playersInPage[id];

                            return _TableItem(
                              context: context,
                              player: player,
                              predictedPoints: 5.2,
                              position: position,
                              replacedPlayer: replacedPlayer,
                            );
                          },
                        ),
                      ],
                    ),
                    const Pagination(),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _PlayerFilter extends StatelessWidget {
  const _PlayerFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<SelectPlayerStore>(context);

    return SizedBox(
      width: 240,
      child: ListView(
        children: [
          const Text(
            "Filters",
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10.0),
          TextField(
            onChanged: store.onChangedSearchPlayerField,
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
                  onChanged: store.onChangedMinPrice,
                  style: const TextStyle(fontSize: 14.0),
                  textAlign: TextAlign.center,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: [
                    DecimalTextInputFormatter(decimalRange: 1),
                    FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d*')),
                  ],
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
                  onChanged: store.onChangedMaxPrice,
                  style: const TextStyle(fontSize: 14.0),
                  textAlign: TextAlign.center,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: [
                    DecimalTextInputFormatter(decimalRange: 1),
                    FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d*')),
                  ],
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
  final BuildContext context;
  final Player player;
  final double predictedPoints;
  final String position;
  final Player? replacedPlayer;

  _TableItem({
    required this.context,
    required this.player,
    required this.predictedPoints,
    required this.position,
    this.replacedPlayer,
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
              player.fullName,
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
            const Text(""),
            Text("$predictedPoints"),
            _SelectPlayerButton(
              player: player,
              position: position,
              replacedPlayer: replacedPlayer,
            ),
          ],
        );
}

class _SelectPlayerButton extends StatelessWidget {
  const _SelectPlayerButton({
    Key? key,
    required this.player,
    required this.position,
    this.replacedPlayer,
  }) : super(key: key);

  final Player player;
  final String position;
  final Player? replacedPlayer;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: InkWell(
        onTap: () {
          if (replacedPlayer != null) {
            Navigator.pop(context, [
              player,
              replacedPlayer!,
            ]);
          } else {
            Navigator.pop(context, [
              player,
            ]);
          }
        },
        child: Icon(
          Icons.arrow_forward_ios,
          size: 24.0,
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
