import 'package:flutter/material.dart';
import 'package:fpl/configs/colors.dart';

class ComparisonPage extends StatefulWidget {
  ComparisonPage({Key? key}) : super(key: key);

  @override
  State<ComparisonPage> createState() => _ComparisonPageState();
}

class _ComparisonPageState extends State<ComparisonPage> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          const Text(
            "Comparisons",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 24.0,
            ),
          ),
          const SizedBox(height: 24.0),
          SizedBox(
            width: double.infinity,
            height: 300.0,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: ThemeColors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: _PlayerCard(),
                  ),
                ),
                const SizedBox(width: 30.0),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: ThemeColors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: _PlayerCard(),
                  ),
                ),
                const SizedBox(width: 30.0),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: ThemeColors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: Icon(
                          Icons.add_box,
                          size: 64.0,
                          color: ThemeColors.main,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PlayerCard extends StatelessWidget {
  const _PlayerCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.close,
              color: Colors.red,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Trent Alexander-Arnold",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  "https://resources.premierleague.com/premierleague/photos/players/110x140/p169187.png",
                  height: 200.0,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
