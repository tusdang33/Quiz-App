import 'package:flutter/material.dart';
import 'package:flutter_quiz_app_newbie/model/question_result.dart';

class ResultItem extends StatelessWidget {
  const ResultItem({super.key, required this.result});
  final QuestionResult result;

  @override
  Widget build(Object context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: 50,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: result.isCorrect()
                      ? const Color.fromARGB(255, 150, 198, 241)
                      : const Color.fromARGB(255, 249, 133, 241),
                ),
                child: Text(
                  result.index.toString(),
                  style: const TextStyle(color: Colors.white),
                )),
            const SizedBox(width: 30.0),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(result.question,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold)),
                Text(result.userAnswer,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 150, 198, 241),
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold)),
                Text(result.correctAnswer,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 249, 133, 241),
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold)),
              ],
            ))
          ]),
    );
  }
}
