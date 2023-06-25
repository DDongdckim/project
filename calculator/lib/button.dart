import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final color;
  final buttonText;
  final buttonTapped;
  const Button({super.key, this.color, this.buttonText, this.buttonTapped});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: const CircleBorder(),
      ),
      child: Text(
        buttonText,
        style: TextStyle(fontSize: 30, color: Colors.white),
      ),
      onPressed: buttonTapped,
    );
  }
}
