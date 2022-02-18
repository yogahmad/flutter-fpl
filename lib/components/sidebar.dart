import 'package:flutter/material.dart';
import 'package:fpl/configs/colors.dart';

class SidebarItemList {
  static String dashboard = "Dashboard";
  static String comparison = "Comparison";
  static String analytics = "Analytics";
  static String settings = "Settings";
}

class Sidebar extends StatefulWidget {
  const Sidebar({
    Key? key,
    required this.changeActivePage,
    required this.activePage,
  }) : super(key: key);

  final Function changeActivePage;
  final String activePage;

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  late String activeItem;

  void changeActiveItem(newActiveItem) {
    if (activeItem == newActiveItem) return;
    setState(() {
      activeItem = newActiveItem;
    });
    widget.changeActivePage(newActiveItem);
  }

  @override
  void initState() {
    activeItem = widget.activePage;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 218.0,
      color: ThemeColors.white,
      child: Column(
        children: [
          const SizedBox(height: 35.0),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 15.0,
            ),
            child: Text(
              "FPL",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 22.0,
                color: ThemeColors.blackText,
              ),
            ),
          ),
          const SizedBox(height: 35.0),
          _SidebarItem(
            icon: Icons.dashboard,
            itemName: SidebarItemList.dashboard,
            changeActiveItem: changeActiveItem,
            activeItem: activeItem,
          ),
          const SizedBox(height: 20.0),
          _SidebarItem(
            icon: Icons.compare,
            itemName: SidebarItemList.comparison,
            changeActiveItem: changeActiveItem,
            activeItem: activeItem,
          ),
          const SizedBox(height: 20.0),
          _SidebarItem(
            icon: Icons.analytics,
            itemName: SidebarItemList.analytics,
            changeActiveItem: changeActiveItem,
            activeItem: activeItem,
          ),
          const SizedBox(height: 20.0),
          _SidebarItem(
            icon: Icons.settings,
            itemName: SidebarItemList.settings,
            changeActiveItem: changeActiveItem,
            activeItem: activeItem,
          ),
        ],
      ),
    );
  }
}

class _SidebarItem extends StatelessWidget {
  const _SidebarItem({
    Key? key,
    required this.icon,
    required this.itemName,
    required this.activeItem,
    this.isExpanded = false,
    required this.changeActiveItem,
  }) : super(key: key);

  final String itemName;
  final String activeItem;
  final IconData icon;
  final Function changeActiveItem;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => changeActiveItem(itemName),
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          decoration: itemName == activeItem
              ? BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.center,
                    colors: [
                      const Color(0x00ACA9FF),
                      ThemeColors.white,
                    ],
                  ),
                )
              : null,
          child: Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: (itemName == activeItem)
                      ? ThemeColors.main
                      : ThemeColors.inactiveIcon,
                ),
                const SizedBox(width: 16.0),
                Text(
                  itemName,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: (itemName == activeItem)
                        ? ThemeColors.main
                        : ThemeColors.inactiveIcon,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
