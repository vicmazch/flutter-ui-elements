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
];