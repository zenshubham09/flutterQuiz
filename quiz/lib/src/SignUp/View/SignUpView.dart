import 'package:flutter/material.dart';

class SignUpView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SignUpViewState( );
  }
}

class SignUpViewState extends State {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
                shape: CircleBorder( ),
                clipBehavior: Clip.hardEdge,
                color: Colors.transparent,
                child: Ink.image(
                  image: AssetImage( 'images/shubham.jpg' ),
                  fit: BoxFit.cover,
                  width: 100.0,
                  height: 100.0,
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10, top: 30, bottom: 10, right: 10),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    labelText: 'First Name',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10, bottom: 10, right: 10),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
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
                  decoration: InputDecoration(
                    labelText: 'Email address'
                  ),
                ),
              ),
              Container(
                padding:EdgeInsets.only(left: 10, bottom: 10, right: 10),
                child: TextField(
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    labelText: 'Password'
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 30, 20, 10),
                width: 280,
                child: RaisedButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    print('Email1: ${emailController.text}  Password1: ${passwordController.text}');
                  },
                  child: Text('Sign Up',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}