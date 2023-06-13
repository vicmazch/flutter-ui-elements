import 'package:flutter/material.dart';

class AppTheme {
  final int selectedColor;
  static List<Color> colorList = [
    Colors.blue,
    Colors.teal,
    Colors.green,
    Colors.red,
    Colors.purple,
    Colors.deepPurple,
    Colors.orange,
    Colors.pink,
    Colors.pinkAccent
  ];

  AppTheme({
    this.selectedColor = 0,
  }): 
    assert( selectedColor >= 0, 'Selected color must be greater then 0'),
    assert( selectedColor < colorList.length, 'Selected color must be 0 - ${colorList.length-1}');

  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    colorSchemeSeed: colorList[ selectedColor ],
    appBarTheme: const AppBarTheme(
      centerTitle: false
    )
  );



  
}