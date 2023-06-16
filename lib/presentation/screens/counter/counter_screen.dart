import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sec_seven_app/presentation/providers/counter_provider.dart';
import 'package:sec_seven_app/presentation/providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget {
  static const name = 'counter_screen';
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int clickCounter = ref.watch(counterProvider);
    final bool isDarkMode = ref.watch(isDarkModeProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
        actions: [
          IconButton(
            icon: Icon(isDarkMode ? Icons.light_mode_outlined : Icons.dark_mode_outlined),
            onPressed: () {
              ref.read( isDarkModeProvider.notifier )
                .update((state) => !state);
            }, 
          )
        ],
      ),
      body: Center(
        child: Text('Valor: $clickCounter', style: Theme.of(context).textTheme.titleLarge,),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        // * OPTION 1 
        ref.read( counterProvider.notifier ).state++;
        // * OPTION 2
        // ref.read(counterProvider.notifier).update((state) => state+1);
      }, child: const Icon(Icons.add)),
    );
  }
}