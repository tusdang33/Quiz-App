import 'package:flutter/material.dart';
import 'package:flutter_quiz_app_newbie/data/questions.dart';
import 'package:flutter_quiz_app_newbie/model/question_result.dart';
import 'package:flutter_quiz_app_newbie/question_screen.dart';
import 'package:flutter_quiz_app_newbie/result_screen.dart';
import 'package:flutter_quiz_app_newbie/start_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 78, 13, 151),
            Color.fromARGB(255, 107, 15, 168),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
          child: const MyHomePage(),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var activeScreen = Screen.start;
  final List<QuestionResult> listResult = [];
  void switchScreen(Screen screen) {
    setState(() {
      activeScreen = screen;
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (activeScreen) {
      case Screen.start:
        {
          return StartScreen(
            onNavigatePressed: () {
              switchScreen(Screen.question);
            },
          );
        }
      case Screen.question:
        {
          return QuestionScreen(onAnswerPicked: (pickedAnswer) {
            int answerIndex = pickedAnswer["index"] as int;
            listResult.add(QuestionResult(
                index: answerIndex,
                question: (questions[answerIndex]).question,
                userAnswer: pickedAnswer["user_answer"] as String,
                correctAnswer: (questions[answerIndex]).answers.first));
            bool isLastQuetion = answerIndex >= questions.length - 1;
            if (isLastQuetion) switchScreen(Screen.result);
            return isLastQuetion;
          });
        }
      case Screen.result:
        return ResultScreen(
          results: listResult,
          onNavigatePressed: () {
            switchScreen(Screen.start);
            listResult.clear();
          },
        );
    }
  }
}

enum Screen { start, question, result }
