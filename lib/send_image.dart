import 'dart:io';
import 'dart:math';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class SendImage extends StatefulWidget {
  @override
  _SendImageState createState() => _SendImageState();
}

class _SendImageState extends State<SendImage> {

  File _image;
  final DatabaseReference imageReference = FirebaseDatabase.instance
      .reference().child("IMAGES");

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  void sendImage(File image) async {
    if(image!=null) {
      final StorageReference firebaseStorageRef = FirebaseStorage.instance.ref()
          .child('My Uploads')
          .child(randomString());
      //in child we give the name of the file which we want to upload to firebase
      final StorageUploadTask uploadTask = firebaseStorageRef.putFile(image);

      final StorageTaskSnapshot downloadUrl =
      (await uploadTask.onComplete);
      final String url = (await downloadUrl.ref.getDownloadURL());
      imageReference.push().set(url).then((value) {
        _showInSnackBar(context, "Image Sent");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Send Image'),
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
                height: 50.0,
              ),
              new Container(
                width: screenWidth,
                height: 200.0,
                child: _image==null?Image.asset('assets/vegeta2.jpg'):Image.file(_image),
              ),
              new SizedBox(
                height: 50.0,
              ),
              new Row(
                children: <Widget>[
                  new Expanded(
                    child: Align(
                      alignment:Alignment.centerLeft,
                      child: RaisedButton(
                        color: Colors.blue,
                        child: Text(
                          'Pick Image',
                          style: TextStyle(fontSize: 15.0, color: Colors.white),
                        ),
                        onPressed: () {
                          getImage();
                        },
                      ),
                    ),
                  ),
                  new Expanded(
                    child: Align(
                      alignment:Alignment.centerRight,
                      child: RaisedButton(
                        color: Colors.blue,
                        child: Text(
                          'Send Image',
                          style: TextStyle(fontSize: 15.0, color: Colors.white),
                        ),
                        onPressed: () {
                          if(_image!=null){
                            sendImage(_image);
                          } else {
                            _showInSnackBar(context, "Select Something");
                          }
                        },
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  String randomString({int length: 6}) {
    var rand = new Random();
    var codeUnits = new List.generate(length, (index) {
      return rand.nextInt(33) + 89;
    });

    return new String.fromCharCodes(codeUnits);
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

