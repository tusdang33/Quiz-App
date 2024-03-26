import 'package:flutter/material.dart';
import 'package:flutter_quiz_app_newbie/data/questions.dart';
import 'package:flutter_quiz_app_newbie/ui/answer_button.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onAnswerPicked});

  final bool Function(
    Map<String, Object>,
  ) onAnswerPicked;

  @override
  State<StatefulWidget> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;
  void onAnswer(String answer) {
    Map<String, Object> pickingAnswer = {
      "index": currentQuestionIndex,
      "user_answer": answer
    };
    setState(() {
      if (!widget.onAnswerPicked(pickingAnswer)) {
        currentQuestionIndex++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              question.question,
              style: const TextStyle(
                color: Color.fromARGB(255, 201, 153, 251),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(),
            ...question.getShuffledAnswers().map((answer) {
              return Container(
                  margin: const EdgeInsets.symmetric(vertical: 5.0),
                  child: AnswerButton(onPressed: onAnswer, answer: answer));
            })
          ],
        ),
      ),
    );
  }
}
