import 'dart:math';
import 'package:flutter/material.dart';

class GradientContainer extends StatefulWidget {
  const GradientContainer({Key? key}) : super(key: key);

  @override
  State<GradientContainer> createState() => _GradientContainerState();
}

class _GradientContainerState extends State<GradientContainer> {
  late int _diceNumber; // Variable to store the current dice number

  @override
  void initState() {
    super.initState();
    _rollDice(); // Initialize the dice number when the widget is initialized
  }

  void _rollDice() {
    setState(() {
      _diceNumber = Random().nextInt(6) + 1; // Generate a random number between 1 and 6
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 173, 195, 223),
            Color.fromARGB(255, 89, 109, 199),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: _rollDice, // Call _rollDice function when button is clicked
              child: Text(
                'Roll Dice',
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 20),
            Image.asset(
              'assets/images/dice-$_diceNumber.png',
              width: 200,
            ),
          ],
        ),
      ),
    );
  }
}
