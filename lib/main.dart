import 'package:flutter/material.dart';
import 'package:turma5/screens/menu_screen.dart';
import 'screens/dice_screen.dart';
import 'screens/personal_card_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/menu',
      routes: {
        '/menu': (_) => const MenuScreen(),
        '/personal-card': (_) => const PersonalCardScreen(),
        '/dice': (_) => const DiceScreen(),
      }
    );
  }
}
