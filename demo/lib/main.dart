import 'package:flutter/material.dart';
import 'forum_first.dart';
import 'forum_second.dart';
import 'login.dart';
import 'signup.dart';
import 'colors.dart';
import 'inhale.dart';
import 'chat.dart';
import 'screens/chat_screen.dart';
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Forum',
      theme: new ThemeData(
        primarySwatch: AppColorsTheme.myTheme.primarySwatch,
      ),
      routes: <String, WidgetBuilder>{
        /*'/':      , //(BuildContext context) => new LoginPage(),*/
        //'/': (BuildContext context) => new ForumPage(),
        '/': (BuildContext context) => new MyHomePage(),
        '/signup': (BuildContext context) => new SignupPage(),
        '/forum': (BuildContext context) => new ForumPage(),
        '/login': (BuildContext context) => new MyHomePage(),
        '/inhale': (BuildContext context) => new MyInhale(),
        '/chat': (BuildContext context) => new HomeScreen(),
        //'/forumpost': (BuildContext context) => new ForumDetailPage(),
      },
      initialRoute: '/',
    );
  }
}