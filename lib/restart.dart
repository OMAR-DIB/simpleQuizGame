import 'package:flutter/material.dart';
import 'package:small_quiz/data/question.dart';

class Restart extends StatelessWidget {
  Restart(this.selectedAnswer, {super.key});

  final List<String> selectedAnswer;

  List<Map<String, Object>> getListMap() {
    final List<Map<String, Object>> summary = [];
    var i = 0;
    while (i < question.length) {
      summary.add({
        'question_nd': i,
        'question_content': question[i].quest,
        'user_answer': selectedAnswer[i],
        'correct_answer': question[i].answer[0],
      });
      i++;
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Hello'),
          SizedBox(
            height: 15,
          ),
          ...getListMap().map(
            (e) => Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(child: Text(((e['question_nd'] as int)+1).toString())),
                    Expanded(
                      child: Column(children: [
                        Text(e['question_content'].toString()),
                      Text(e['user_answer'].toString()),
                      Text(e['correct_answer'].toString()),
                      ],),
                    ),
                  ],
                ),
                
              ],
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text('Restart'),
          ),
        ],
      ),
    );
  }
}
