import 'package:flutter/material.dart';
import 'package:quiz/src/Question/Model/QuizQuestionModel.dart';
import 'package:quiz/src/SignUp/View/SignUpView.dart';
import 'package:http/http.dart' as http;
class SignUpController extends StatelessWidget {


  List<QuizModel> quizData;
  SignUpController(this.quizData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Container(
        child: SingleChildScrollView(
            child: SignUpView(this.quizData)
        ),
      ),
    );
  }
}
