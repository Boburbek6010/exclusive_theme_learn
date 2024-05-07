import 'package:exclusive_theme_learn/controllers/theme_controller.dart';
import 'package:exclusive_theme_learn/pages/home_page.dart';
import 'package:exclusive_theme_learn/style/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await ThemeController.init();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box<bool>>(
      valueListenable: context.mode.notifier,
      builder: (context, _, __) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeAnimationStyle: AnimationStyle(
            curve: Curves.decelerate,
            // duration: const Duration(seconds: 3),
          ),
          theme: AppTheme(
            mode: context.mode.read
                ? ThemeMode.light
                : ThemeMode.dark,
          ).switchTheme(),
          home: const HomePage(),
        );
      }
    );
  }
}

// class Counter extends ValueListenable with ChangeNotifier {
//   int _count = 0;
//
//   int get count => _count;
//
//   void increment() {
//     _count++;
//     notifyListeners();
//   }
//
//   @override
//   get value => _count;
// }