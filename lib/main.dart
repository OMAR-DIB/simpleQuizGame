import 'package:flutter/material.dart';
import 'package:small_quiz/data/question.dart';
import 'package:small_quiz/home.dart';
import 'package:small_quiz/restart.dart';
import 'dart:developer';
import 'package:small_quiz/test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> selectedAnswer = [];
  Widget? switchScreen;

  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);
    print(answer);
    if (selectedAnswer.length == question.length) {
      setState(() {
        
      switchScreen =  Restart(selectedAnswer);
      selectedAnswer = [];
      });
    }
  }

  void switchS() {
    setState(() {
      switchScreen = Test(chooseAnswer);
    });
  }

  void restartScreen() {
    setState(() {
      switchScreen = Home(switchS);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    switchScreen = Home(switchS);
  }

  List<Color> colors = [
    Colors.red,
    Colors.yellow,
    Colors.green,
    Colors.blue,
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: colors,
                begin: Alignment.centerLeft,
                end: Alignment.centerRight),
          ),
          child: switchScreen,
        ),
      ),
    );
  }
}
