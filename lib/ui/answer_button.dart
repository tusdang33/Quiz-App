import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(
      {super.key, required this.onPressed, required this.answer});
  final void Function(String answer) onPressed;
  final String answer;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          onPressed(answer);
        },
        style: ElevatedButton.styleFrom(
          elevation: 1.0,
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          backgroundColor: const Color.fromARGB(255, 33, 1, 95),
          foregroundColor: const Color.fromARGB(255, 255, 255, 255),
        ),
        child: Text(
          answer,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ));
  }
}
