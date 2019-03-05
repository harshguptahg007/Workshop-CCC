import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class FetchText extends StatefulWidget {
  @override
  _FetchTextState createState() => _FetchTextState();
}

class _FetchTextState extends State<FetchText> {
  List<String> messages;
  StreamSubscription<Event> _onMessageAddedSubscription;
  final DatabaseReference messageReference =
      FirebaseDatabase.instance.reference().child("TEXT");

  @override
  void initState() {
    messages = new List();
    _onMessageAddedSubscription =
        messageReference.onChildAdded.listen(_onMessageAdded);

    super.initState();
  }

  _onMessageAdded(Event event) {
    String text = event.snapshot.value;
    setState(() {
      messages.add(text);
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Get Text'),
        centerTitle: true,
      ),
      body: Container(
        height: screenHeight,
        width: screenWidth,
        margin: EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            new SizedBox(
              height: 100.0,
            ),
            Text(
              'The text that you sent is fetched here',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 20.0,
              ),
              textAlign: TextAlign.center,
            ),
            new SizedBox(
              height: 50.0,
            ),
            messages.length>0?_listMessages():_noMessage(),
          ],
        ),
      ),
    );
  }

  Widget _listMessages() {
    return new ListView.builder(
      shrinkWrap: true,
      //when using shrink wrap, itemCount is necessary
      itemCount: messages.length,
      itemBuilder: (context, int index) {
        return Container(
          margin: EdgeInsets.only(top: 5.0),
          child: Text(
            messages[index],
            style: TextStyle(
              color: Colors.blue,
              fontSize: 20.0,
            ),
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }

  Widget _noMessage(){
    return Text(
      "No Messages Sent Yet!\n Send a new message now...",
      style: TextStyle(
        color: Colors.blue,
        fontSize: 20.0,
      ),
      textAlign: TextAlign.center,
    );
  }

  @override
  void dispose() {
    _onMessageAddedSubscription.cancel();
    super.dispose();
  }
}
