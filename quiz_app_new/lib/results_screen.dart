import 'package:flutter/material.dart';
import 'package:quiz_app_new/data/questions.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.answerList, required this.onAction});

  final List<String> answerList;
  final Function(String value) onAction;

  @override
  Widget build(BuildContext context) {
    int numberOfCorrectAnswers = 0;
    List<Map<String, Object>> summary = [];

    //To dynamically change interface according to the results 
    Color color;
    String remarks;

    for (var i = 0; i < answerList.length; i++) {
      summary.add({
        'questionIndex': i,
        'question': questions[i].question,
        'correct_answer': questions[i].answers[0],
        'user_answer': answerList[i],
      });
    }

    for (var j = 0; j < summary.length; j++) {
      if (summary[j]['user_answer'] == summary[j]['correct_answer']) {
        numberOfCorrectAnswers++;
      }
    }

    if (numberOfCorrectAnswers >= 7) {
      color = Colors.green;
      remarks = "Great!";
    } else if (numberOfCorrectAnswers >= 4) {
      color = Colors.yellow;
      remarks = "Fair!";
    } else {
      color = Colors.red;
      remarks = "Weak!";
    }

    return Center(
        child: SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 40,
          ),
          const Text('Results',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 36,
                  fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: color,
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(16.0),
                  fixedSize: const Size(120, 120)),
              child: Text(
                "$numberOfCorrectAnswers/${summary.length}",
                style: const TextStyle(fontSize: 28),
              )),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8.0)),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(remarks,
                  style: TextStyle(
                      fontSize: 32, fontWeight: FontWeight.bold, color: color)),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          for (int i = 0; i < summary.length; i++)
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${summary[i]['question']}",
                            style: TextStyle(
                                color: summary[i]['user_answer'] ==
                                        summary[i]['correct_answer']
                                    ? Colors.green
                                    : Colors.red,
                                fontSize: 24,
                                fontWeight: FontWeight.bold)),
                        const SizedBox(height: 10),
                        Text("User Answer : ${summary[i]['user_answer']}",
                            style: TextStyle(
                                color: summary[i]['user_answer'] ==
                                        summary[i]['correct_answer']
                                    ? Colors.black
                                    : Colors.red,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                        Text(
                            "Correct Answer : ${summary[i]['correct_answer']}\n",
                            style: const TextStyle(
                                color: Colors.green,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                      ]),
                ),
              ),
            ),
          OutlinedButton(
              onPressed: () {
                onAction('start');
              },
              style: TextButton.styleFrom(backgroundColor: Colors.white),
              child: const Text(
                'Restart',
                style: TextStyle(fontSize: 20),
              ))
        ],
      ),
    ));
  }
}