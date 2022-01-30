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
                          child: Column(
                            children: [
                              Text(
                                model.correctAnswer,
                                style: TextStyle(color: Colors.white),
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                            insetPadding: EdgeInsets.all(100.0),
                                            title: Text(model.category)));
                                  },
                                  child: Text('Category')),
                            ],
                          ),
                        ),
                        backgroundColor: Colors.deepPurpleAccent,
                      ));
            },
            child: Text('Correct Answer'),
          ),
          ElevatedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                        title: Center(child: const Text('Alert')),
                        actions: [
                          ElevatedButton(
                            onPressed: () {},
                            child: Text('Yes'),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.green,
                            ),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text('No'),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.red,
                            ),
                          ),
                        ],
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        content: Builder(
                          builder: (context) {
                            // Get available height and width of the build area of this widget. Make a choice depending on the size.
                            var height = MediaQuery.of(context).size.height;
                            var width = MediaQuery.of(context).size.width;

                            return Container(
                              height: height - 500,
                              width: width - 0,
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      child: Text('A'),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      child: Text('B'),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      child: Text('C'),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      child: Text('D'),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ));
            },
            child: const Text('Another'),
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
