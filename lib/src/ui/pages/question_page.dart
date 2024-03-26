import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/src/data/usecases/db_list_questions.dart';
import 'package:quiz/src/domain/entities/question.dart';
import 'package:quiz/src/ui/components/answer_button.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({
    super.key,
    required this.onSelectAnswer,
  });

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionPage> createState() {
    return _QuestionPageState();
  }
}

class _QuestionPageState extends State<QuestionPage> {
  int currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);

    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Question question = DbListQuestions().list()[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              question.title,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...question.shuffledAnswers.map((answer) {
              return AnswerButton(
                answer: answer,
                onTap: () {
                  answerQuestion(answer);
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
