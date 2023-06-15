import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackBarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';

  const SnackBarScreen({super.key});

  void showCustomSnackbar( BuildContext context ) {
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackbar =  SnackBar(
      content: const Text('Hola mundo..'),
      duration: const Duration( seconds: 1),
      action: SnackBarAction( label: 'Ok!', onPressed: () {}, ),
    );

    ScaffoldMessenger.of(context).showSnackBar(
      snackbar
    );
  }

  void openDialog( BuildContext context ) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Estas seguro?'),
        content: const Text('Laborum exercitation dolore voluptate culpa exercitation reprehenderit elit excepteur irure nulla veniam elit est ad. Commodo anim irure quis exercitation sit exercitation pariatur ut dolore laborum. Et quis pariatur labore magna exercitation ut exercitation labore tempor aliquip veniam culpa. Mollit pariatur ea ipsum id culpa consectetur ex exercitation dolore nulla laborum. Laborum nostrud ullamco labore eiusmod magna. Labore ut nulla cillum ad amet voluptate minim. Anim sit est eiusmod labore aliqua.'),
        actions: [
          TextButton(onPressed: () => { context.pop() }, child: const Text('Cancelar')),
          FilledButton(onPressed: () => { context.pop() }, child: const Text('Aceptar')),
        ],
     ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars & Dialog'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(onPressed: () {
              
              showAboutDialog(
                context: context, 
                children: [
                  const Text('Laborum proident minim irure voluptate proident laboris. Ad dolore duis officia proident ipsum consectetur tempor eiusmod nostrud id aliquip eu. Laboris nisi esse duis ad aliqua consequat fugiat do cillum sunt. Ut nisi laboris duis id culpa cillum minim laborum enim. Consequat quis fugiat cillum id sint exercitation. Id voluptate ad quis ut mollit pariatur aliquip sunt non incididunt proident aute mollit.')
                ]
              );
            }, child: const Text('Licencias')),
            FilledButton.tonal(onPressed: () => openDialog(context), child: const Text('Mostrar Dialog')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar Snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
        onPressed: () => showCustomSnackbar(context), 
      ),
    );
  }
}