import 'package:flutter/material.dart';
import 'package:quiz/src/Quiz/View/QuizView.dart';
import 'package:quiz/src/Question/Model/QuizQuestionModel.dart';

class QuizController extends StatelessWidget {

  List<QuizModel> quizData;
  QuizController(var quizData){
    this.quizData = quizData;
  }

  @override
  Widget build(BuildContext context) {
    return QuizView(this.quizData);
  }
}