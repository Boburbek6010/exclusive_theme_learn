import 'package:exclusive_theme_learn/controllers/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.colorScheme.onSecondary,
      appBar: AppBar(
        title: const Text('ValueNotifier Example'),
        actions: [
          ValueListenableBuilder<Box<bool>>(
            valueListenable: context.mode.notifier,
            builder: (context, _, __){
              return IconButton(
                onPressed: context.mode.update,
                icon: context.mode.read
                    ? const Icon(Icons.light_mode)
                    : const Icon(Icons.dark_mode),
              );
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Container(
              color: context.theme.colorScheme.primaryContainer,
              alignment: Alignment.center,
              height: 100,
              width: 100,
            ),

            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // counter.increment();
              },
              child: const Text('Increment'),
            ),
          ],
        ),
      ),
    );
  }
}
