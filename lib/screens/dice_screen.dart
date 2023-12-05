import 'dart:math';

import 'package:flutter/material.dart';

class DiceScreen extends StatefulWidget {
  const DiceScreen({super.key});

  @override
  State<DiceScreen> createState() => _DiceScreenState();
}

class _DiceScreenState extends State<DiceScreen> {
  var dice1 = 1;
  var dice2 = 3;
  final random = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: InkWell(
        onTap: onBothDicePressed,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: onDice1Pressed,
                    child: Image.asset('assets/images/dice$dice1.png'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: InkWell(
                    onTap: onDice2Pressed,
                    child: Image.asset('assets/images/dice$dice2.png'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onBothDicePressed() {
    onDice1Pressed();
    onDice2Pressed();
  }

  void onDice1Pressed() {
    dice1 = random.nextInt(6) + 1;
    setState(() {});
  }

  void onDice2Pressed() {
    dice2 = random.nextInt(6) + 1;
    setState(() {});
  }
}
