import 'package:flutter/material.dart';
import 'package:quiz/src/Quiz/Controller/QuizController.dart';
import 'package:quiz/src/Question/Model/QuizQuestionModel.dart';
import 'package:quiz/src/SignUp/Controller/SignUpController.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginView extends StatefulWidget {
  final List<QuizModel> quizData;
  LoginView(this.quizData);

  @override
  State<StatefulWidget> createState() {
    return LoginViewState(quizData);
  }
}

class LoginViewState extends State {
  final email = TextEditingController();
  final password = TextEditingController();

  List<QuizModel> quizData;
  LoginViewState(this.quizData);

  @override
  void initState() {
    email.clear();
    password.clear();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    email.dispose();
    password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return SingleChildScrollView(
          child: Container(
              child: Column(
            children: <Widget>[
              Card(
                margin: EdgeInsets.only(bottom: 10),
                child: Container(
                  padding: EdgeInsets.only(top: 30),
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
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.done,
                          controller: email,
                          decoration:
                              new InputDecoration(labelText: 'Email Address'),
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.only(left: 20, right: 20, bottom: 20),
                        child: TextField(
                          obscureText: true,
                          controller: password,
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.done,
                          decoration:
                              new InputDecoration(labelText: 'Password'),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: 280,
                child: RaisedButton(
                  color: Colors.blueAccent,
                  onPressed: () {
                    print('Login button pressed');
                    signIn(context);
                  },
                  child: Text('Login'),
                  textColor: Colors.white,
                ),
              ),
              Container(
                height: 40,
                child: Text(
                  'or',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                width: 280,
                child: RaisedButton(
                  color: Colors.blue,
                  onPressed: () {
                    email.clear();
                    password.clear();
                    print('Sign up button pressed');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                SignUpController(this.quizData)));
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                  textColor: Colors.white,
                ),
              )
            ],
          )),
        );
      },
    );
  }

  Future<void> signIn(BuildContext context) async {
    const baseURL =
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key';
    const apiKey = 'AIzaSyBo33vTaAO_ZuLQQd8N318gB2_2mQC0-Hg';
    const url = '$baseURL=$apiKey';

    final response = await http.post(url,
        body: json.encode({
          'email': email.text,
          'password': password.text,
          'returnSecureToken': true
        }));
    print(jsonDecode(response.body));

    if (response.statusCode == 200) {
      print('User us successfully login');
      navigateToNextScreen(context);
    } else {
      print('Some error occoured while login');
    }
  }

  /*
   Function to Navigate to new Screen
  */
  Future navigateToNextScreen(context) async {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => QuizController(this.quizData)));
  }
}
