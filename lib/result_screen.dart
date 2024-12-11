import 'package:flutter/material.dart';
import 'package:shoot/models/questions.dart';
import 'package:shoot/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.chosenAnswers,
  });

  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'questions': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': chosenAnswers[i],
        },
      );
    }

    return summary;
  }

  @override
  Widget build(context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You answered X out of Y Questions correctly!'),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(getSummaryData()),
            SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: () {},
              child: Text('Restart Quiz!'),
            ),
          ],
        ),
      ),
    );
  }
}
