import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.title, 
    required this.subTitle, 
    required this.link, 
    required this.icon
  });

}

const List<MenuItem> appMenuItems = [
   MenuItem(title: 'Botones', subTitle: 'Varios botones en Flutter', link: '/buttons', icon: Icons.smart_button_outlined),
   MenuItem(title: 'Tarjetas', subTitle: 'Un contenedor estilizado', link: '/cards', icon: Icons.credit_card),
   MenuItem(title: 'Progress Indicators', subTitle: 'Generales y controlados', link: '/progress', icon: Icons.refresh_rounded),
   MenuItem(title: 'Snackbars & Dialogs', subTitle: 'Indicadores', link: '/snackbar', icon: Icons.info_outline),
   MenuItem(title: 'Animated Container', subTitle: 'Stateful widget animated', link: '/animations', icon: Icons.animation_outlined),
   MenuItem(title: 'UI Controls', subTitle: 'Checkboxes, radius, and tiles', link: '/ui-controls', icon: Icons.check_circle_outline_outlined),
   MenuItem(title: 'App tutorial', subTitle: 'Tutorial app...', link: '/app-tutorial', icon: Icons.insert_comment_rounded),
   MenuItem(title: 'Infinite Scroll & Pull to refresh', subTitle: 'Infinite Scroll & Pull to refresh', link: '/infinite-scroll', icon: Icons.list),
   MenuItem(title: 'Counter', subTitle: 'Counter Riverpod', link: '/counter-screen', icon: Icons.add_circle_outline_rounded),
   MenuItem(title: 'Theme', subTitle: 'Theme Changer', link: '/theme-changer', icon: Icons.color_lens_outlined),
];