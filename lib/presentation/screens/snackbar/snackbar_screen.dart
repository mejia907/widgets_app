import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';
  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    const snackbar = SnackBar(
      content: Text('Hola mundo'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Estas seguro?'),
        content: const Text(
            'Qui enim commodo veniam ex minim duis sit velit velit tempor deserunt mollit nisi aliquip. Nostrud ex mollit fugiat non enim nostrud commodo ut. Id enim Lorem velit laborum amet cillum est consectetur adipisicing culpa magna dolor non ex. Laborum ex cillum est reprehenderit esse est amet irure velit occaecat reprehenderit reprehenderit. Laboris exercitation fugiat non ut ex. Occaecat in amet laborum ea ex qui in occaecat mollit.'),
        actions: [
          TextButton(
              onPressed: () => context.pop(), child: const Text('Cancelar')),
          FilledButton(
              onPressed: () => context.pop(), child: const Text('Aceptar'))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y Diálogos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton(
              onPressed: () {
                showAboutDialog(context: context, children: [
                  const Text(
                      'Labore esse ea in irure ut mollit minim officia quis. Irure velit sint ut aute voluptate minim aute anim. Labore veniam velit dolore labore sint aliqua cupidatat aliqua consequat ullamco mollit minim duis duis. Incididunt tempor mollit eiusmod nisi ad veniam eiusmod tempor ad occaecat ea mollit sit do.')
                ]);
              },
              child: const Text('Licencias usadas'),
            ),
            const SizedBox(
              height: 15,
            ),
            FilledButton(
              onPressed: () {
                openDialog(context);
              },
              child: const Text('Mostrar diálogo'),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            showCustomSnackbar(context);
          },
          label: const Text('Mostrar Snackbar'),
          icon: const Icon(Icons.remove_red_eye_outlined)),
    );
  }
}
