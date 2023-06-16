import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sec_seven_app/config/menu/menu_item.dart';

class SideMenu extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const SideMenu({super.key, required this.scaffoldKey});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {

  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
  
  final bool hasNotch = MediaQuery.of(context).viewPadding.top > 35;

    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (value) {
        final menuItem =  appMenuItems[value];
        setState(() {
          navDrawerIndex = value;
        });
        context.push(menuItem.link);
        widget.scaffoldKey.currentState?.closeDrawer();
      },
      children: [
        Padding(padding: EdgeInsets.fromLTRB(30, hasNotch ? 10 : 20, 15, 10), child: const Text('Main'),),
        ... appMenuItems
          .sublist(0,3)
          .map((item) => NavigationDrawerDestination(
            icon: Icon(item.icon), 
            label: Text(item.title)
            ),
          ),
        const Padding(padding: EdgeInsets.fromLTRB(30, 15, 30, 10), child: Divider(),),
        const Padding(padding: EdgeInsets.fromLTRB(30, 10, 15, 10), child: Text('More options'),),
        ... appMenuItems
          .sublist(3)
          .map((item) => NavigationDrawerDestination(
            icon: Icon(item.icon), 
            label: Text(item.title)
            ),
          ),
      ],
    );
  }
}