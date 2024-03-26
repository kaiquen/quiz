import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/src/data/usecases/db_list_questions.dart';
import 'package:quiz/src/ui/components/question_summary.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({
    super.key,
    required this.chosenAnswers,
    required this.onRestart,
  });

  final void Function() onRestart;
  final List<String> chosenAnswers;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summaryData = [];

    for (int i = 0; i < chosenAnswers.length; i++) {
      summaryData.add({
        'question_index': i + 1,
        'question': DbListQuestions().list()[i].title,
        "correct_answer": DbListQuestions().list()[i].answers[0],
        'answer': chosenAnswers[i],
      });
    }

    return summaryData;
  }

  @override
  Widget build(BuildContext context) {
    final numTotalQuestions = DbListQuestions().list().length;
    final numCorrectQuestions = summaryData
        .where((data) => data["answer"] == data["correct_answer"])
        .length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!",
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionSummary(summaryData: summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              onPressed: onRestart,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.refresh),
              label: const Text("Restart Quiz!"),
            ),
          ],
        ),
      ),
    );
  }
}
