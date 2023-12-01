import 'dart:convert';
import 'dart:io';

class QuizQuestion {
  QuizQuestion(this.question, this.answers);

  final String question;
  final List<String> answers;

  //To get Random Answers
  List<String> getRandomAnswers() {
    final randomAnswers = List.of(answers);
    randomAnswers.shuffle();
    return randomAnswers;
  }

  static List<QuizQuestion> loadQuestions() {
    final file = File('assets/questions.json');
    final jsonString = file.readAsStringSync();

    final List<dynamic> jsonList = jsonDecode(jsonString);
    final List<QuizQuestion> questions = jsonList.map((json) => QuizQuestion(
      json['question'] as String,
      (json['answers'] as List<dynamic>).cast<String>(),
    )).toList();

    return questions;
  }
}
