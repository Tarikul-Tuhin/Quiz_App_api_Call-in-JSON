import 'package:flutter/material.dart';
import 'package:quiz_api_call/quiz_model.dart';
import 'package:fluttertoast/fluttertoast.dart';

class QuestionFormat extends StatelessWidget {
  final QuizModel model;
  const QuestionFormat({required this.model, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Text(
            model.questions,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          options('True'),
          options('False'),
          ElevatedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: Center(
                          child: Text(
                            model.correctAnswer,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        backgroundColor: Colors.deepPurpleAccent,
                      ));
            },
            child: Text('Correct Answer'),
          ),
        ],
      ),
    );
  }

  Widget options(String text) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () {
          if (model.correctAnswer == text) {
            Fluttertoast.showToast(msg: "Correct Answer Tuhin");
          } else {
            Fluttertoast.showToast(msg: 'Incorrect Answer Tuhin');
          }
        },
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(5),
            color: Colors.lightBlueAccent,
          ),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 17.0,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
    );
  }
}
