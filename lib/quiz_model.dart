class QuizModel {
  late String correctAnswer, incorrectAnswer, questions, category;

  QuizModel(
      {required this.correctAnswer,
      required this.incorrectAnswer,
      required this.questions,
      required this.category});

  QuizModel.fromJson(Map<String, dynamic> map) {
    questions = map['question'];
    correctAnswer = map['correct_answer'];
    incorrectAnswer = map['incorrect_answers'][0];
    category = map['category'];
  }
}
