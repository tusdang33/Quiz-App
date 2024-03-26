import 'package:flutter/material.dart';
import 'package:flutter_quiz_app_newbie/model/question_result.dart';
import 'package:flutter_quiz_app_newbie/ui/result_item.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.results, required this.onNavigatePressed});
  final List<QuestionResult> results;
  final void Function() onNavigatePressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Your result",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 30.0),
          SizedBox(
            width: double.infinity,
            height: 300.0,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ...results.map((result) {
                    return ResultItem(result: result);
                  })
                ],
              ),
            ),
          ),
          const SizedBox(height: 30.0),
          OutlinedButton.icon(
            onPressed: onNavigatePressed,
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            icon: const Icon(Icons.replay_outlined),
            label: const Text(
              "Restart Quiz",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
