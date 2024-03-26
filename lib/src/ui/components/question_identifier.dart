import 'package:flutter/material.dart';

class QuestionIdentifier extends StatelessWidget {
  const QuestionIdentifier({
    super.key,
    required this.isCorrectAnswer,
    required this.question,
  });

  final int question;
  final bool isCorrectAnswer;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isCorrectAnswer ? Colors.lightBlueAccent : Colors.redAccent,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        question.toString(),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}
