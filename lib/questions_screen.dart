import 'package:flutter/material.dart';

import 'package:shoot/answer_button.dart';
import 'package:shoot/models/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({
    super.key,
    required this.onSelectedAnswer,
  });

  final void Function(String answer) onSelectedAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var questionIndex = 0;
  void answerQuestion(String pickedAnswer) {
    widget.onSelectedAnswer(pickedAnswer);
    setState(() {
      questionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[questionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 224, 129, 235),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentQuestion.theShuffledAnswers().map((answers) {
              return AnswerButton(
                answerText: answers,
                onTap: () {
                  answerQuestion(answers);
                },
              );
            })
          ],
        ),
      ),
    );
  }
}
