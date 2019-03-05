import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class FetchImage extends StatefulWidget {
  @override
  _FetchImageState createState() => _FetchImageState();
}

class _FetchImageState extends State<FetchImage> {
  List<String> urls;
  StreamSubscription<Event> _onURLAddedSubscription;
  final DatabaseReference messageReference =
      FirebaseDatabase.instance.reference().child("IMAGES");

  ScrollController controller;

  @override
  void initState() {
    controller = new ScrollController();
    urls = new List();
    _onURLAddedSubscription = messageReference.onChildAdded.listen(_onURLAdded);
    super.initState();
  }

  _onURLAdded(Event event) {
    String url = event.snapshot.value;
    setState(() {
      urls.add(url);
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
        child: SingleChildScrollView(
          controller: controller,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              new SizedBox(
                height: 50.0,
              ),
              Text(
                'The image that you sent is fetched here',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20.0,
                ),
                textAlign: TextAlign.center,
              ),
              new SizedBox(
                height: 30.0,
              ),
              urls.length > 0 ? _listImages() : _noImage(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _onURLAddedSubscription.cancel();
    super.dispose();
  }

  Widget _listImages() {
    return new ListView.builder(
      shrinkWrap: true,
      //when using shrink wrap, itemCount is necessary
      controller: controller,
      itemCount: urls.length,
      itemBuilder: (context, int index) {
        return Container(
          margin: EdgeInsets.only(top: 20.0),
          child: FadeInImage.assetNetwork(
            placeholder: 'assets/vegeta2.jpg',
            image: urls[index],
            height: 200.0,
            width: 200.0,
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }

  Widget _noImage() {
    return Text(
      "No Images Uploaded Yet!\n Upload a new image now...",
      style: TextStyle(
        color: Colors.blue,
        fontSize: 20.0,
      ),
      textAlign: TextAlign.center,
    );
  }
}
