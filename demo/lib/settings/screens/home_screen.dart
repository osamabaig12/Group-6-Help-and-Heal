import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:settings/screens/change_username_default.dart';
import 'package:settings/screens/change_password_default.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  List<String> sets = ["change username","change password","delete account","log out"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'heal&help',
          style: TextStyle(
            fontSize: 25.0,
            color: Colors.white,
          ),
        ),
        elevation: 0.0,
      ),
      body: new Card(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new Container(
              padding: new EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: new Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget> [
                  new Text(
                    'settings',
                      style: new TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      )
                    ),
                  ]
                )
              ),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: SizedBox(
                width: double.infinity,
                child: new FlatButton(
                    onPressed: (){
                      Navigator.push
                        (context,
                          MaterialPageRoute(builder: (context) => ChangeUsername()),
                      );
                      },
                    child: Text('change username',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                        )),
                    color: Theme.of(context).primaryColor,
                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))

                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: SizedBox(
                width: double.infinity,
                child: new FlatButton( onPressed: (){
                  Navigator.push
                    (context,
                    MaterialPageRoute(builder: (context) => ChangePassword()),
                  );
                },
                    child: Text('change password',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                        )),
                    color: Theme.of(context).primaryColor,
                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))

                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: SizedBox(
                width: double.infinity,
                child: new FlatButton(onPressed: (){},
                    child: Text('delete account',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                        )),
                    color: Theme.of(context).primaryColor,
                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))

                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: SizedBox(
                width: double.infinity,
                child: new FlatButton(onPressed: (){},
                    child: Text('log out',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                        )),
                    color: Theme.of(context).primaryColor,
                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))

                ),
              ),
            ),
            ]
          ),
        elevation: 0.0,
        )
      );
    }

  }
