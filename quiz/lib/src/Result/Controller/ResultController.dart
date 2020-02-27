import 'package:flutter/material.dart';
import 'package:quiz/src/Question/Controller/QuestionController.dart';
import 'package:quiz/src/Question/Model/QuizQuestionModel.dart';
import 'package:quiz/src/Quiz/Controller/QuizController.dart';
import 'package:quiz/src/Result/View/ResultView.dart';

class ResultController extends StatefulWidget {
  int score, totalQuestions, correct, incorrect, notAttempted;

  List<Questions> quizData;
  List<QuizModel> quizModel;

  ResultController(
      {this.score,
      this.totalQuestions,
      this.correct,
      this.incorrect,
      this.notAttempted,
      this.quizData,
      this.quizModel});

  @override
  _ResultControllerState createState() => _ResultControllerState(this.quizData, this.quizModel);
}

class _ResultControllerState extends State<ResultController> {


  List<Questions> quizData;
  List<QuizModel> quizModel;

  _ResultControllerState(var quizData, var quizModel){
    this.quizData = quizData;
    print('Quiz Model: $quizModel');
    this.quizModel = quizModel;
  }

  String feedback = "";
  @override
  void initState() {
    super.initState();

    var percentage = (widget.score / (widget.totalQuestions * 20)) * 100;
    if (percentage >= 90) {
      feedback = "OutStanding";
    } else if (percentage > 80 && percentage < 90) {
      feedback = "Excellent";
    } else if (percentage > 70 && percentage < 80) {
      feedback = "Great Job";
    } else if (percentage > 50 && percentage < 70) {
      feedback = 'Need some Improvement';
    } else if (percentage < 50) {
      feedback = "Your feedback is not good";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              '$feedback',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'You scored ${widget.score} out of ${widget.totalQuestions * 20}',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 18),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              '${widget.correct} Correct, ${widget.incorrect} Incorrect, ${widget.notAttempted} Not Attempted out of ${widget.totalQuestions}',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 11,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => QuestionController(this.quizData, this.quizModel)));
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 54),
                child: Text(
                  'Play Quiz now',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: Colors.blue),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                print(quizModel);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => QuizController(quizModel)));
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 54),
                child: Text(
                  'Go to Home',
                  style: TextStyle(
                      color: Colors.blue,
                      backgroundColor: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: Colors.blue, width: 2)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
