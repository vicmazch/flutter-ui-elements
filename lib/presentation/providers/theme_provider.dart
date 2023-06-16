
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sec_seven_app/config/theme/app_theme.dart';

final isDarkModeProvider = StateProvider<bool>((ref) => false);

final selectedColorProvider = StateProvider<int>((ref) => 0);

// * PROVIDER: PARA ESTADOS INMUTABLES
final colorListProvider = Provider<List<Color>>((ref) => colorList);

// * UN OBJETO DE TIPO APPTHEME (CUSTOM)
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier()
);


class ThemeNotifier extends StateNotifier<AppTheme> {

  // * STATE == NEW APPTHEME()
  ThemeNotifier()
    : super( AppTheme());

  void toggleDrakMode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeColorIndex( int colorIndex ) {
    state = state.copyWith(selectedColor: colorIndex);
  }
}