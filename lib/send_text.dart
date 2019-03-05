import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class SendText extends StatefulWidget {
  @override
  _SendTextState createState() => _SendTextState();
}

class _SendTextState extends State<SendText> {

  final DatabaseReference messageReference =
  FirebaseDatabase.instance.reference().child("TEXT");

  TextEditingController controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Send Text'),
        centerTitle: true,
      ),
      body: Container(
        height: screenHeight,
        width: screenWidth,
        margin: EdgeInsets.symmetric(horizontal: 30.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              new SizedBox(
                height: 150.0,
              ),
              Container(
                child: new TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                    hintStyle: TextStyle(color: Colors.blue, fontSize: 20.0),
                    hintText: 'Enter something',
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              new SizedBox(
                height: 50.0,
              ),
              GestureDetector(
                onTap: () {
                  if (controller.text.length > 1) {
                    messageReference.push().set(controller.text).then((value){
                      _showInSnackBar(context, "Message sent");
                    });
                  } else {
                    _showInSnackBar(context, "Enter something");
                  }
                },
                child: Container(
                  height: 50.0,
                  width: 150.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32.0),
                    color: Colors.lightBlueAccent,
                  ),
                  child: Center(
                    child: Text(
                      'Send',
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
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

  void _showInSnackBar(BuildContext context, String value) {

    Scaffold.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(
        new SnackBar(
          content: new Text(value),
          duration: Duration(milliseconds: 2000),
        ),
      );

  }

}

