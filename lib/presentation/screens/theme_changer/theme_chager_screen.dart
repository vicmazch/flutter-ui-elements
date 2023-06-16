import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sec_seven_app/config/theme/app_theme.dart';
import 'package:sec_seven_app/presentation/providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {
  static const name = 'theme_changer_screen';
  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    // final bool isDarkMode = ref.watch(isDarkModeProvider);
    final bool isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Changer Screen'),
        actions: [
          IconButton(
            icon: Icon(isDarkMode ? Icons.light_mode_outlined : Icons.dark_mode_outlined),
            onPressed: () {
              ref.read( themeNotifierProvider.notifier ).toggleDrakMode();
              // ref.read( isDarkModeProvider.notifier )
              //   .update((state) => !state);
            }, 
          )
        ],
      ),
      body: const _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView(
    // { super.key, }
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final AppTheme appThemeProvider = ref.watch(themeNotifierProvider);
    final List<Color> colors = ref.watch(colorListProvider);
    // final int colorsSelected = ref.watch(selectedColorProvider);

    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final color = colors[index];
        return RadioListTile(
          title: Text('Este color', style: TextStyle(color: color),),
          subtitle: Text('${color.value}'),
          activeColor: color,
          value: index, 
          groupValue: appThemeProvider.selectedColor, 
          onChanged: (value) { 
            // * OPCION CON StateNotifier, UNA INSTACIA COMPLETA DE APPTHEME...
            ref.read(themeNotifierProvider.notifier).changeColorIndex(index);
            // * OPCION 1:
            // ref.read(selectedColorProvider.notifier).state = index;
            // * OPCION PARA RECUEPRAR EL STATE ANTERIOR...
            // ref.read(selectedColorProvider.notifier).update((state) => state = value!.toInt()); 
          },
        );
      },
    );
  }
}