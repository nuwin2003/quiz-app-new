//List of Questions and Answers
import 'package:quiz_app_new/models/quiz_question.dart';

List<QuizQuestion> questions = [
  QuizQuestion(
    'What are the main building blocks of Flutter UIs?',
    [
      'Widgets', // Correct Answer
      'Components',
      'Blocks',
      'Functions',
    ],
  ),
  QuizQuestion('How are Flutter UIs built?', [
    'By combining widgets in code', // Correct Answer
    'By combining widgets in a visual editor',
    'By defining widgets in config files',
    'By using XCode for iOS and Android Studio for Android',
  ]),
  QuizQuestion(
    'What\'s the purpose of a StatefulWidget?',
    [
      'Update UI as data changes', // Correct Answer
      'Update data as UI changes',
      'Ignore data changes',
      'Render UI that does not depend on data',
    ],
  ),
  QuizQuestion(
    'Which widget should you try to use more often: StatelessWidget or StatefulWidget?',
    [
      'StatelessWidget', // Correct Answer
      'StatefulWidget',
      'Both are equally good',
      'None of the above',
    ],
  ),
  QuizQuestion(
    'What happens if you change data in a StatelessWidget?',
    [
      'The UI is not updated', // Correct Answer
      'The UI is updated',
      'The closest StatefulWidget is updated',
      'Any nested StatefulWidgets are updated',
    ],
  ),
  QuizQuestion(
    'What is the key configuration file used when building a Flutter project?',
    [
      'pubspec.yaml', // Correct Answer
      'pubspec.xml',
      'config.html',
      'root.xml',
    ],
  ),
  QuizQuestion(
    'What type of test can examine your code as a complete system?',
    [
      'Integration Tests', // Correct Answer
      'Unit tests',
      'Widget tests',
      'All of the above',
    ],
  ),
  QuizQuestion(
    'How should you update data inside of StatefulWidgets?',
    [
      'By calling setState()', // Correct Answer
      'By calling updateData()',
      'By calling updateUI()',
      'By calling updateState()',
    ],
  ),
  QuizQuestion(
    'Access to a cloud database through Flutter is available through which service?',
    [
      'Firebase Database', // Correct Answer
      'SQLite',
      'NOSQL',
      'MYSQL',
    ],
  ),
  QuizQuestion(
    'What type of Flutter animation allows you to represent real-world behavior?',
    [
      'Physics-based', // Correct Answer
      'Maths-based',
      'Graph-based',
      'Sim-based',
    ],
  ),
];
