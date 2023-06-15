import 'package:flutter/material.dart';
import 'dart:math' show Random;

import 'package:sec_seven_app/config/theme/app_theme.dart';
class AnimatedScreen extends StatefulWidget {
  static const name = 'animated_screen';

  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {

  double width = 50;
  double height = 50;
  Color color = Colors.indigo;
  double borderRadius = 10.0;

  final colors = AppTheme().getColorList();

  void changeShape() {
    final random = Random();

    width = random.nextInt(300) + 50;
    height = random.nextInt(300) + 50;
    // color = colors[random.nextInt(colors.length-1)];
    color = Color.fromRGBO(random.nextInt(255), random.nextInt(255), random.nextInt(255), random.nextDouble()*1);
    borderRadius = random.nextDouble()*100;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated container'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 1000),
          curve: Curves.elasticInOut,
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(borderRadius)
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => changeShape(),
        child: const Icon(Icons.play_arrow_rounded),
      ),
    );
  }
}