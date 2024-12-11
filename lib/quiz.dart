import 'package:flutter/material.dart';
import 'package:shoot/start_screen.dart';
import 'package:shoot/questions_screen.dart';
import 'package:shoot/models/questions.dart';
import 'package:shoot/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];

  var activeScreen = 'start-screen';

  // Widget? activeScreen;
  /* @override
  void initState() {
    activeScreen = MainScreen(switchScreen);
    super.initState();
  } */

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void pickedAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  @override
  Widget build(context) {
    Widget screenWidget = MainScreen(switchScreen);
    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        onSelectedAnswer: pickedAnswer,
      );
    }

    if (activeScreen == 'results-screen') {
      screenWidget = ResultScreen(
        chosenAnswers: selectedAnswers,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 145, 29, 165),
                Color.fromARGB(255, 183, 34, 209),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
