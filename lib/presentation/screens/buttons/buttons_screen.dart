import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  static const String name = 'buttons_screen';

  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons'),
      ),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pop(),
        child: const Icon( Icons.arrow_back_ios_new_outlined),
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView(
    // {super.key,}
  );

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Wrap(
          spacing: 10,
          // crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(onPressed: () => {}, child: const Text('Elevated')),
            const ElevatedButton(onPressed: null, child: Text('Elevated Disabled')),
            ElevatedButton.icon(
              onPressed: () => {},
              icon: const Icon(Icons.access_alarm_outlined),
              label: const Text('Elevated icon'),
            ),
            FilledButton(onPressed: () => {}, child: const Text('Filled')),
            FilledButton.icon(
              onPressed: () => {}, 
              label: const Text('Filled icon'), 
              icon: const Icon(Icons.terminal)
            ),
            OutlinedButton(onPressed: () => {}, child: const Text('Outlined')),
            OutlinedButton.icon(
              onPressed: () => {}, 
              label: const Text('Outlined icon'), 
              icon: const Icon(Icons.account_balance_outlined)
            ),
            TextButton(onPressed: () => {}, child: const Text('TextButton')),
            TextButton.icon(
              onPressed: () => {}, 
              label: const Text('TextButton icon'), 
              icon: const Icon(Icons.telegram)
            ),
            IconButton(
              onPressed: () => {}, 
              icon: const Icon( Icons.temple_buddhist_outlined,),
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(colors.primary),
                iconColor: const MaterialStatePropertyAll(Colors.white) 
              ),
            ),
            const CustomButton()
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Material(
        color: colors.primary,
        child: InkWell(
          onTap: () => {},
          child: const Padding(
            padding: EdgeInsets.all(10),
            child: Text('Hola mundo...', style: TextStyle(color: Colors.white),),
          ),
        ),
      ),
    );
  }
}