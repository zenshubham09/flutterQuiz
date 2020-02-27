import 'package:flutter/material.dart';
import 'package:quiz/src/SignUp/View/SignUpView.dart';

class SignUpController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Container(
        child: SingleChildScrollView(
            child: SignUpView()
        ),
      ),
    );
  }
}
