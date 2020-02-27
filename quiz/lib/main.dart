import 'package:flutter/material.dart';
import 'src/Login/Controller/LoginViewController.dart';
import 'package:quiz/src/Question/Model/QuizQuestionModel.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

main() {
  runApp(App());
}

class App extends StatelessWidget {

  List<QuizModel> list;
  Future<List<QuizModel>> getData() async {

    String url = "https://5e53f8e231b9970014cf8045.mockapi.io/getQuizData/quizData";

    var res = await http.get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
    print('Response : ${res.body}');
    if (res.statusCode == 200) {
      var data = json.decode(res.body);
      list = data.map<QuizModel>((json) => QuizModel.fromJson(json)).toList();
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: FutureBuilder(
        future: getData(),
        builder: (context, AsyncSnapshot<List<QuizModel>> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.green,
              ),
            );
          }
          return LoginViewController(this.list);
        },
      ),
    ));
  }
}

