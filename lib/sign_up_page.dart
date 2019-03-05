import 'package:flutter/material.dart';
import 'package:workshop_2/home_page.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController nameController = new TextEditingController();

  bool emailError=false,passwordError=false,nameError=false;

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
                backgroundImage: AssetImage('assets/vegeta.png'),
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
                    errorText: emailError?'Email is in wrong format':null,
                    errorStyle: TextStyle(
                      fontSize: 15.0,
                      color: Colors.red,
                    ),
                  ),
                  textAlign: TextAlign.center,
                  onChanged: (value){
                    if(value.length>=1){
                      setState(() {
                        emailError = false;
                      });
                    }
                  },
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
                    errorText: passwordError?'Password must be atleast 8 characters':null,
                    errorStyle: TextStyle(
                      fontSize: 15.0,
                      color: Colors.red,
                    ),
                  ),
                  onChanged: (value){
                    if(value.length>=1){
                      setState(() {
                        passwordError = false;
                      });
                    }
                  },
                  textAlign: TextAlign.center,
                ),
              ),
              new SizedBox(
                height: 15.0,
              ),
              new Container(
                child: TextField(
                  controller: nameController,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                    hintText: 'User name',
                    hintStyle: TextStyle(
                      color: Colors.blue,
                      fontSize: 18.0,
                    ),
                    errorText: nameError?'User name should be atleast 6 characters':null,
                    errorStyle: TextStyle(
                      fontSize: 15.0,
                      color: Colors.red,
                    ),
                  ),
                  textAlign: TextAlign.center,
                  onChanged: (value){
                    if(value.length>=1){
                      setState(() {
                        nameError = false;
                      });
                    }
                  },
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
                    if (emailController.text.length > 10) {
                      if (passwordController.text.length > 8) {
                        if(nameController.text.length>6){
                          //TODO : Use firebase auth function over here
                          String email = emailController.text;
                          String password = passwordController.text;
                          String userName = nameController.text;
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                        }else {
                          setState(() {
                            nameError = true;
                          });
                        }
                      }else {
                        setState(() {
                          passwordError = true;
                        });
                      }
                    }else {
                      setState(() {
                        emailError = true;
                      });
                    }
                  },
                  padding: EdgeInsets.all(12),
                  color: Colors.lightBlueAccent,
                  child: Text(
                    'Sign Up',
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                ),
              ),
              new SizedBox(
                height: 30.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
