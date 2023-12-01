import 'package:flutter/material.dart';
import 'package:quiz_app_new/data/questions.dart';
import 'package:quiz_app_new/question_screen.dart';
import 'package:quiz_app_new/results_screen.dart';
import 'package:quiz_app_new/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  String activeScreen = 'start';
  List<String> selectedAnswers = [];
  //List<QuizQuestion> questions = QuizQuestion.loadQuestions();

  //To change activeScreen value
  void onScreenChange(String value) {
    setState(() {
      activeScreen = value;
    });
  }

  //To add the selected answers
  void onAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'result';
      });
    }
  }

  //To reset the quiz
  void onRestart(String value) {
    setState(() {
      selectedAnswers = [];
      activeScreen = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget? currentScreen = StartScreen(onAction: onScreenChange);
    //To activate start screen
    if (activeScreen == 'start') {
      currentScreen = StartScreen(onAction: onScreenChange);
    }
    //To activate quiz screen
    if (activeScreen == 'quiz') {
      currentScreen =
          QuestionScreen(onAnswer: onAnswer, onAction: onScreenChange);
    }
    //To activate result screen
    if (activeScreen == 'result') {
      currentScreen =
          ResultScreen(onAction: onRestart, answerList: selectedAnswers);
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.white, Colors.blue],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: currentScreen,
      )),
    );
  }
}
