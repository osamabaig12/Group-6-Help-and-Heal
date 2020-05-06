import 'package:flutter/material.dart';
import 'package:settings/screens/home_screen.dart';
import 'package:settings/screens/change_username_default.dart';
import 'package:settings/screens/change_username_error.dart';
import 'package:settings/screens/change_password_error.dart';
import 'package:settings/screens/change_username_successful.dart';
import 'package:settings/screens/change_password_successful.dart';
import 'package:settings/screens/change_password_default.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Settings',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color.fromRGBO(81, 200, 196, 1.0),
        accentColor: Colors.white,
      ),
      home: HomeScreen(),
    );
  }
}
