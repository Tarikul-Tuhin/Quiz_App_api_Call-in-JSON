import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quiz_api_call/question_format.dart';
import 'quiz_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(title: 'Api Integration'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String url =
      "https://opentdb.com/api.php?amount=50&difficulty=easy&type=boolean";

  Future<List<QuizModel>> GetDataFromApi() async {
    var response = await http.get(Uri.parse(url));

    var responseBody = json.decode(response.body);
    print(responseBody);
    List results = responseBody['results'];

    List<QuizModel> model = results.map((e) => QuizModel.fromJson(e)).toList();

    return model;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder(
        future: GetDataFromApi(),
        builder: (context, AsyncSnapshot<List<QuizModel>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return QuestionFormat(model: snapshot.data![index]);
                });
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
