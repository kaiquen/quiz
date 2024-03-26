import 'package:flutter/material.dart';
import 'package:quiz/src/data/usecases/db_list_questions.dart';
import 'package:quiz/src/ui/pages/home_page.dart';
import 'package:quiz/src/ui/pages/question_page.dart';
import 'package:quiz/src/ui/pages/result_page.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() {
    return _QuizAppState();
  }
}

class _QuizAppState extends State<QuizApp> {
  Widget? activeScreen;

  List<String> selectedAnswers = [];

  void choseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == DbListQuestions().list().length) {
      setState(() {
        activeScreen = ResultPage(
          chosenAnswers: selectedAnswers,
          onRestart: restartQuiz,
        );
      });
    }
  }

  @override
  void initState() {
    activeScreen = HomePage(switchScreen);
    super.initState();
  }

  void switchScreen() {
    setState(() {
      activeScreen = QuestionPage(
        onSelectAnswer: choseAnswer,
      );
    });
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = QuestionPage(
        onSelectAnswer: choseAnswer,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.deepPurple.shade900,
              Colors.deepPurple.shade600,
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
