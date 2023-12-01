import 'package:flutter/material.dart';
import 'package:quiz_app_new/answer_button.dart';
import 'package:quiz_app_new/data/questions.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen(
      {super.key, required this.onAnswer, required this.onAction});

  final Function(String value) onAnswer;
  final Function(String value) onAction;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int currentQuestionIndex = 0;
  //List<QuizQuestion> questions = QuizQuestion.loadQuestions();
  
  //To increment questionIndex and save answer
  void answerQuestion(String answer) {
    widget.onAnswer(answer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              questions[currentQuestionIndex].question,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ...questions[currentQuestionIndex]
                .getRandomAnswers()
                .map((answer) => AnswerButton(
                    value: answer,
                    onAnswer: () {
                      //Passing the answer
                      answerQuestion(answer);
                    })),
            const SizedBox(
              height: 40,
            ),
            TextButton(
                onPressed: () {
                  widget.onAction('start');
                },style: TextButton.styleFrom(backgroundColor: Colors.white),
                child: const Text(
                  'Back to Start',
                  style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 0, 0, 0)),
                ))
          ],
        ),
      ),
    );
  }
}
