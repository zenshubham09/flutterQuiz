import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quiz/src/Login/View/LoginView.dart';
import 'package:quiz/src/Question/Model/QuizQuestionModel.dart';

class LoginViewController extends StatelessWidget {

  List<QuizModel> quizData;
  LoginViewController(var quizData) {
    this.quizData = quizData;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Question Quiz'),
        ),
        backgroundColor: Colors.white10,
        body: LoginView(this.quizData),
      ),
    );
  }
}
