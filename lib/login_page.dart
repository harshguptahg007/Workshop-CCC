import 'package:flutter/material.dart';
import 'package:workshop_2/home_page.dart';
import 'package:workshop_2/sign_up_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  bool emailError = false, passwordError = false;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: screenHeight,
        width: screenWidth,
        margin: EdgeInsets.symmetric(horizontal: 30.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              new SizedBox(
                height: 50.0,
              ),
              new CircleAvatar(
                radius: 80.0,
                backgroundImage: AssetImage('assets/goku.jpg'),
              ),
              new SizedBox(
                height: 30.0,
              ),
              new Container(
                child: TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                    hintText: 'Email',
                    hintStyle: TextStyle(
                      color: Colors.blue,
                      fontSize: 18.0,
                    ),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              new SizedBox(
                height: 15.0,
              ),
              new Container(
                child: TextField(
                  controller: passwordController,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                    hintText: 'Password',
                    hintStyle: TextStyle(
                      color: Colors.blue,
                      fontSize: 18.0,
                    ),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              new SizedBox(
                height: 30.0,
              ),
              Container(
                width: screenWidth,
                height: 50.0,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  onPressed: () {
                    if (emailController.text.length > 3) {
                      if (passwordController.text.length > 3) {
                        //TODO : Use firebase auth function over here
                        String email = emailController.text;
                        String password = passwordController.text;
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                      }
                    }
                  },
                  padding: EdgeInsets.all(12),
                  color: Colors.lightBlueAccent,
                  child: Text(
                    'Log In',
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: new Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Text(
                      'Don\' have an account?',
                      style: TextStyle(fontSize: 18.0, color: Colors.grey),
                    ),
                    new GestureDetector(
                      child: new Text(
                        'Sign Up',
                        style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.grey[900],
                            fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        //TODO : navigate to sign up page
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpPage()));
                      },
                    )
                  ],
                ),
              ),
              new SizedBox(
                height: 30.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}

//TODO : to place the sign up text at the bottom of the page
