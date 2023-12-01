//import 'dart:convert';
//import 'dart:io';

import 'package:json_bridge/json_bridge.dart';

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

  //When returning Future<List<QuizQuestion>> can't access length
  //When returning List<QuizQuestion> it's syncronized so error in file path
  static Future<List<QuizQuestion>> loadQuestions() async {
    // final file = File('assets/questions.json');
    // final jsonString = file.readAsStringSync();

    // final List<dynamic> jsonList = jsonDecode(jsonString);
    // final List<QuizQuestion> questions = jsonList
    //     .map((json) => QuizQuestion(
    //           json['question'] as String,
    //           (json['answers'] as List<dynamic>).cast<String>(),
    //         ))
    //     .toList();

    //When using JSONBridge it returns Map
    JSONBridge jsonBridge = JSONBridge()
      ..init(fileName: 'assets/questions.json');

    Map<String, dynamic> questionMap = jsonBridge.read();

    List<QuizQuestion> questions = convertMapToList(questionMap);

    return questions;
  }

  //To convert Map to List
  static List<QuizQuestion> convertMapToList(Map<String, dynamic> myMap) {
    return myMap.entries.map((entry) {
      return QuizQuestion(entry.key, entry.value);
    }).toList();
  }
}
