import 'package:flutter/material.dart';
import 'package:workshop_2/fetch_image.dart';
import 'package:workshop_2/fetch_text.dart';
import 'package:workshop_2/home_page.dart';
import 'package:workshop_2/login_page.dart';
import 'package:workshop_2/send_image.dart';
import 'package:workshop_2/send_text.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}