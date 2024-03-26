class QuestionResult {
  final int index;
  final String question;
  final String userAnswer;
  final String correctAnswer;

  QuestionResult(
      {required this.index,
      required this.question,
      required this.userAnswer,
      required this.correctAnswer});

  
  bool isCorrect() => userAnswer == correctAnswer;
}
