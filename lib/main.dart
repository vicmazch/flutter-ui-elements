import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sec_seven_app/config/router/app_router.dart';
import 'package:sec_seven_app/config/theme/app_theme.dart';
import 'package:sec_seven_app/presentation/providers/theme_provider.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context,  WidgetRef ref) {
    
    // final bool isDarkMode = ref.watch(isDarkModeProvider);
    // final int colorsSelected = ref.watch(selectedColorProvider);
    final AppTheme appTheme = ref.watch(themeNotifierProvider);

    return MaterialApp.router(
      title: 'Flutter Widgets',
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      // theme: AppTheme( selectedColor: colorsSelected, isDarkMode: isDarkMode).getTheme(),
      theme: appTheme.getTheme(),

    );
  }
}
