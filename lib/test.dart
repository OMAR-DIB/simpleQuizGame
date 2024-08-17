import 'package:flutter/material.dart';
import 'package:small_quiz/answer_button.dart';
import '/data/question.dart';

class Test extends StatefulWidget {
  const Test(this.onSelectedAnswer, {super.key});

  final void Function(String) onSelectedAnswer;

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  var current = 0;

  void showRestartDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Quiz Finished!'),
        content: Text('Your score: . Do you want to restart?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              resetQuiz();
            },
            child: Text('Restart'),
          ),
        ],
      ),
    );
  }

  void resetQuiz() {
    setState(() {
      current = 0;
    });
  }

  void moveQuestion(String answer) {
    widget.onSelectedAnswer(answer);
    setState(() {
      current++;
    });
    if (current >= question.length) {
      // Quiz is finished
      //showRestartDialog();
      current = 0;
      
    }
  }

  @override
  Widget build(BuildContext context) {
    final questionList = question[current];
    // final question =

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(questionList.quest),
          const SizedBox(
            height: 15,
          ),
          ...questionList.getShuffeldQuestion().map((element) {
            return Container(
              margin: const EdgeInsets.all(7),
              child: AnswerButton(
                  answer: element,
                  onPressed: () {
                    moveQuestion(element);
                  }),
            );
          }),
          // const SizedBox(
          //   height: 15,
          // ),
          // OutlinedButton.icon(
          //   onPressed: widget.switchH,
          //   label: const Text('Next'),
          //   icon: const Icon(Icons.raw_on),
          // ),
        ],
      ),
    );
  }
}
