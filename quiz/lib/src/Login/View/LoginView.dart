import 'package:flutter/material.dart';
import 'package:quiz/src/Quiz/Controller/QuizController.dart';
import 'package:quiz/src/Question/Model/QuizQuestionModel.dart';

class LoginView extends StatelessWidget {

  List<QuizModel> quizData;
  LoginView(var quizData){
    this.quizData = quizData;
  }

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Card(
                child: Container(
                  padding: EdgeInsets.only(top: 20),
                  height: 250,
                  child: Column(
                    children: <Widget>[
                      Material(
                        elevation: 4.0,
                        shape: CircleBorder(),
                        clipBehavior: Clip.hardEdge,
                        color: Colors.transparent,
                        child: Ink.image(
                          image: AssetImage('images/shubham.jpg'),
                          fit: BoxFit.cover,
                          width: 100.0,
                          height: 100.0,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Enter full name'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                width: 320,
                child: RaisedButton(
                  color: Colors.blueAccent,
                  onPressed: () {
                    print('Login button pressed');
                    navigateToNextScreen(context);
                  },
                  child: Text('Login'),
                  textColor: Colors.white,
                ),
              )
            ],
          )),
    );
  }

/*
    Function to Navigate to new Screen
  */
  Future navigateToNextScreen(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => QuizController(this.quizData)));
  }
}
