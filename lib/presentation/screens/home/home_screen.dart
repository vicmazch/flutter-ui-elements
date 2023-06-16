import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sec_seven_app/config/menu/menu_item.dart';
import 'package:sec_seven_app/presentation/widgets/side_menu.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Flutter + Material 3'),
      ),
      body: const _HomeView(),
      drawer: SideMenu( scaffoldKey: scaffoldKey,),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView(
    // {super.key,}
  );

  @override
  Widget build(BuildContext context) {

    appMenuItems;
    return ListView.builder(
      itemCount: appMenuItems.length,
      itemBuilder: (context, index) {
        final MenuItem item = appMenuItems[index];

        return _CustomTile(item: item);
      },
    );
  }
}

class _CustomTile extends StatelessWidget {
  const _CustomTile({
    // super.key,
    required this.item,
  });

  final MenuItem item;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(item.icon, color: colors.primary,),
      trailing: Icon(Icons.arrow_forward_ios_rounded, color: colors.primary,),
      title: Text(item.title),
      subtitle: Text(item.subTitle),
      onTap: () => { 
        context.push( item.link )
        // context.pushNamed( CardsScreen.name )
        // Navigator.pushNamed(context, item.link)
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (context) => const ButtonsScreen()
        //   )
        // )
      },
    );
  }
}