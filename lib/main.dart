import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fpl/pages/analytics.dart';
import 'package:fpl/pages/comparisons.dart';
import 'package:fpl/pages/dashboard.dart';
import 'package:fpl/stores/active_page.dart';
import 'package:fpl/stores/select_player.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'components/sidebar.dart';
import 'configs/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ActivePageStore>(
          create: (_) => ActivePageStore(),
        ),
        Provider<SelectPlayerStore>(
          create: (_) => SelectPlayerStore(),
        ),
      ],
      child: MaterialApp(
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
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final activePageStore = Provider.of<ActivePageStore>(context);
    return Scaffold(
      body: Container(
        color: ThemeColors.background,
        height: double.infinity,
        width: double.infinity,
        child: Observer(builder: (_) {
          return Row(
            children: [
              Sidebar(
                activePage: activePageStore.activePage,
                changeActivePage: activePageStore.changeActivePage,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: activePageStore.activePage == SidebarItemList.dashboard
                      ? const Dashboard()
                      : activePageStore.activePage == SidebarItemList.analytics
                          ? const AnalyticsPage()
                          : activePageStore.activePage ==
                                  SidebarItemList.comparison
                              ? const ComparisonPage()
                              : Container(),
                ),
              ),
            ],
          );
        }),
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
