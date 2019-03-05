import 'package:flutter/material.dart';
import 'package:workshop_2/fetch_image.dart';
import 'package:workshop_2/fetch_text.dart';
import 'package:workshop_2/login_page.dart';
import 'package:workshop_2/send_image.dart';
import 'package:workshop_2/send_text.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new DrawerHeader(
              child: new Text(
                'User Name',
                style: TextStyle(color: Colors.white, fontSize: 18.0),
                textAlign: TextAlign.center,
              ),
              decoration: BoxDecoration(color: Colors.blue),
            ),
            new ListTile(
              title: new Text(
                "Send Text",
                style: TextStyle(color: Colors.black, fontSize: 18.0),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Scaffold(body: SendText())));
              },
            ),
            new ListTile(
              title: new Text(
                "Fetch Text",
                style: TextStyle(color: Colors.black, fontSize: 18.0),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FetchText()));
              },
            ),
            new ListTile(
              title: new Text(
                "Send Image",
                style: TextStyle(color: Colors.black, fontSize: 18.0),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Scaffold(body: SendImage())));
              },
            ),
            new ListTile(
              title: new Text(
                "Fetch Image",
                style: TextStyle(color: Colors.black, fontSize: 18.0),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FetchImage()));
              },
            ),
            new ListTile(
              title: new Text(
                "Logout",
                style: TextStyle(color: Colors.black, fontSize: 18.0),
              ),
              onTap: () {
                //TODO : logout user when this tapped
                Navigator.pop(context);
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: new Text('Home Page'),
        backgroundColor: Colors.blue,
        elevation: 0.0,
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Colors.blue,
            Colors.lightBlueAccent,
          ],
        )),
        height: screenHeight,
        width: screenWidth,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 30.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                new SizedBox(
                  height: 40.0,
                ),
                new CircleAvatar(
                  radius: 80.0,
                  backgroundImage: AssetImage('assets/goku.jpg'),
                ),
                new SizedBox(
                  height: 30.0,
                ),
                new Text(
                  'Welcome Dark Knight',
                  style: TextStyle(color: Colors.white, fontSize: 25.0),
                ),
                new SizedBox(
                  height: 30.0,
                ),
                new Text(
                  'Lorem ipsum tortor iaculis in a interdum ut adipis cing, netus bibendum convallis venenatis et '
                      'curabitur condimentum, velit scelerisque at metus class laoreet mattis. Massa velit suspendisse '
                      'turpis eleifend orci sapien ornare litora, per tempus aliquet senectus pretium tristique hac '
                      'condimentum netus, a quam ut mollis phasellus mattis hendrerit.',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
