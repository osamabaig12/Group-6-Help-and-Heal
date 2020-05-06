import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:settings/screens/change_username_successful.dart';

class ChangeUsername3 extends StatefulWidget {
  @override
  _ChangeUsername3State createState() => _ChangeUsername3State();
}

class _ChangeUsername3State extends State<ChangeUsername3> {

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
              //fontWeight: FontWeight.bold,
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
                    padding: new EdgeInsets.only(top: 70.0, bottom: 70.0),
                    child: new Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget> [
                          new Text(
                              'change username',
                              style: new TextStyle(
                                fontSize: 40.0,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor,
                              )

                          ),


                        ]

                    )

                ),

                    new Text(
                        'username successfully updated!',
                        textAlign: TextAlign.center,

                        style: new TextStyle(
                          fontSize: 30.0,
                          color: Theme.of(context).primaryColor,
                        )
                    ),

                new Container(
                  height: 100.0,
                ),

                new FlatButton(onPressed: (){},


                    child: Text('back',
                        style: new TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        )),
                    color: Theme.of(context).primaryColor,
                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))

                ),





              ]),
          elevation: 0.0,

        )

    );

  }
}
