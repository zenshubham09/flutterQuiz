import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quiz/src/Login/Controller/LoginViewController.dart';
import 'package:quiz/src/Question/Model/QuizQuestionModel.dart';

class SignUpView extends StatefulWidget {

  final List<QuizModel> quizData;
  SignUpView(this.quizData);

  @override
  State<StatefulWidget> createState() {
    return SignUpViewState(this.quizData);
  }
}

class SignUpViewState extends State {

  List<QuizModel> quizData;
  SignUpViewState(this.quizData);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();


  Future<void> signUp(BuildContext context) async {

    const baseURL = 'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key';
    const apiKey = 'AIzaSyBo33vTaAO_ZuLQQd8N318gB2_2mQC0-Hg';
    const url ='$baseURL=$apiKey';

    final response = await http.post(url,
        body: json.encode({
          'email': emailController.text,
          'password': passwordController.text,
          'returnSecureToken': true
        }));
    print(jsonDecode(response.body));

    if (response.statusCode == 200) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginViewController(quizData)));
    } else {
      print('There is some error while registering: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Container(
          padding: EdgeInsets.only(top: 50),
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
                padding:
                    EdgeInsets.only(left: 10, top: 30, bottom: 10, right: 10),
                child: TextField(
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    labelText: 'First Name',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10, bottom: 10, right: 10),
                child: TextField(
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    labelText: 'Last Name',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10, bottom: 10, right: 10),
                child: TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(labelText: 'Email address'),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10, bottom: 10, right: 10),
                child: TextField(
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(labelText: 'Password'),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 30, 20, 10),
                width: 280,
                child: RaisedButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    print(
                        'Email1: ${emailController.text}  Password1: ${passwordController.text}');
                    signUp(context);
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
