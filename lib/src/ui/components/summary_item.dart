import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/src/ui/components/question_identifier.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(
    this.itemData, {
    super.key,
  });

  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer = itemData["answer"] == itemData["correct_answer"];

    return Container(
      margin: const EdgeInsets.all(10),
      child: Row(
        children: [
          QuestionIdentifier(
            isCorrectAnswer: isCorrectAnswer,
            question: itemData["question_index"] as int,
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  itemData["question"] as String,
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  itemData["answer"] as String,
                  style: const TextStyle(
                    color: Colors.red,
                  ),
                ),
                Text(
                  itemData["correct_answer"] as String,
                  style: const TextStyle(
                    color: Colors.blue,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}