import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fpl/pages/analytics.dart';
import 'package:fpl/pages/comparisons.dart';
import 'package:fpl/pages/dashboard.dart';
import 'package:google_fonts/google_fonts.dart';

import 'components/sidebar.dart';
import 'configs/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // scrollBehavior: MyCustomScrollBehavior(),
      theme: ThemeData(
        textTheme: GoogleFonts.nunitoTextTheme(
          Theme.of(context).textTheme,
        ),
        iconTheme: IconThemeData(
          color: ThemeColors.inactiveIcon,
          size: 24.0,
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String activePage = SidebarItemList.comparison;

  void changeActivePage(String newPage) {
    setState(() {
      activePage = newPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: ThemeColors.background,
        height: double.infinity,
        width: double.infinity,
        child: Row(
          children: [
            Sidebar(
              activePage: activePage,
              changeActivePage: changeActivePage,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: activePage == SidebarItemList.dashboard
                    ? const Dashboard()
                    : activePage == SidebarItemList.analytics
                        ? AnalyticsPage()
                        : activePage == SidebarItemList.comparison
                            ? ComparisonPage()
                            : Container(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
