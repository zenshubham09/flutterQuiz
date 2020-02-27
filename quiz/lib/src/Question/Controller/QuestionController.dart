import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:quiz/src/Question/Model/QuestionModel.dart';
import 'package:quiz/src/Question/Model/QuizQuestionModel.dart';
import 'package:quiz/src/Result/Controller/ResultController.dart';

class QuestionController extends StatefulWidget {

  List<Questions> quizData;
  List<QuizModel> quizModel;

  QuestionController(var quizData, var quizModel){
    this.quizData = quizData;
    this.quizModel = quizModel;
  }

  @override
  _QuestionControllerState createState() => _QuestionControllerState(this.quizData, this.quizModel);
}

class _QuestionControllerState extends State<QuestionController>
    with SingleTickerProviderStateMixin {

  List<Questions> quizData;
  List<QuizModel> quizModel;

  _QuestionControllerState(var quizData, var quizModel){
    this.quizData = quizData;
    this.quizModel = quizModel;
  }

  Animation animation;
  AnimationController animationController;

  double beginAnimation = 0.0;
  double endAnimation = 1.0;

  int index = 0;
  int correct = 0, incorrect = 0, notAttempted = 0, points = 0;
  Color color;
  int length = 0;

  final currentContainer = Container();

  @override
  void initState() {
    super.initState();
    color = Colors.cyanAccent;

    animationController = animationController =
        AnimationController(duration: const Duration(seconds: 10), vsync: this)
          ..addListener(() {
            setState(() {});
          });

    animation = Tween(begin: beginAnimation, end: endAnimation)
        .animate(animationController);
    startAnimation();

    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          if (index < quizData.length - 1) {
            print("Question is attempted by user");
            index++;
            notAttempted++;
            resetAnimation();
            startAnimation();
          } else {

            print('Question is not attempted by user');
            notAttempted++;
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ResultController(
                          score: points,
                          correct: correct,
                          incorrect: incorrect,
                          notAttempted: notAttempted,
                          totalQuestions: quizData.length,
                          quizData: this.quizData,
                          quizModel: this.quizModel,
                        )));
          }
        });
      }
    });
  }

  Widget listViewWidget(List<Questions> data) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 80),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: <Widget>[
                  Text(
                    '${index + 1}/${data.length}',
                    style:
                    TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'Questions',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: Colors.grey),
                  ),
                  Spacer(),
                  Text(
                    '$points',
                    style:
                    TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    ' Points',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: Colors.grey),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            LinearProgressIndicator(
              value: animation.value,
            ),
            SizedBox(height: 20),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 10, right: 10),
              color: Colors.white10,
              height: 45,
              child: Text(
                "Q${index+1}: ${this.quizData[index].question}",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                    color: Colors.black87),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: this.quizData[index].incorrectAnswers.length,
                itemBuilder: (context, optionIndex) {
                  return Container(
                    alignment: Alignment.centerLeft,
                    padding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: GestureDetector(

                      onTap: () {
                        if (this.quizData[index].incorrectAnswers[optionIndex].isCorrect) {
                          print('Correct option is selected');
                          setState(() {

                            points = points + 20;

                            if (index < quizData.length - 1) {
                              index++;
                              correct++;
                              resetAnimation();
                              startAnimation();
                            } else {
                              resetAnimation();
                              stopAnimation();
                              correct++;
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ResultController(
                                        score: points,
                                        correct: correct,
                                        incorrect: incorrect,
                                        notAttempted: notAttempted,
                                        totalQuestions: quizData.length,
                                        quizData: this.quizData,
                                        quizModel: this.quizModel,
                                      )));
                            }
                          });
                        } else {
                          print('InCorrect option is selected');

                          points = points - 10;
                          if (index < quizData.length - 1) {
                            index++;
                            incorrect++;
                            resetAnimation();
                            startAnimation();
                          } else {
                            incorrect++;
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ResultController(
                                      score: points,
                                      correct: correct,
                                      incorrect: incorrect,
                                      notAttempted: notAttempted,
                                      totalQuestions: quizData.length,
                                      quizData: this.quizData,
                                      quizModel: this.quizModel,
                                    )));
                          }
                        }
                      },
                      child: Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: 10),
                        height: 55,
                        child: Text('${this.quizData[index].incorrectAnswers[optionIndex].text}',
                          softWrap: true,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w400

                          ),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(width: 1)),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz"),
          automaticallyImplyLeading: false
      ),
      body: listViewWidget(this.quizData),
    );
  }

  startAnimation() {
    animationController.forward();
  }

  resetAnimation() {
    animationController.reset();
  }

  stopAnimation() {
    animationController.stop();
  }
}
