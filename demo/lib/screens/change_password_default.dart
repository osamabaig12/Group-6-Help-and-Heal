import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:settings/screens/change_password_default.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).accentColor,
        appBar: AppBar(

          centerTitle: true,
          //leading: Icon(Icons.arrow_back, color: Colors.white,),

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
                              'change password',
                              style: new TextStyle(
                                fontSize: 40.0,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor,
                              )
                          ),
                        ]
                    )
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: new TextFormField(
                    decoration: new InputDecoration(
                      labelText: "current password",
                      fillColor: Colors.white,
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide: new BorderSide(
                        ),
                      ),
                    ),
                    validator: (val) {
                      if(val.length==0) {
                        return "password cannot be empty";
                      }else{
                        return null;
                      }
                    },
                    keyboardType: TextInputType.text ,
                    style: new TextStyle(
                      fontFamily: "Poppins",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: new TextFormField(
                    decoration: new InputDecoration(
                      labelText: "new password",
                      fillColor: Colors.white,
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide: new BorderSide(
                        ),
                      ),
                      //fillColor: Colors.green
                    ),
                    validator: (val) {
                      if(val.length==0) {
                        return "password cannot be empty";
                      }else{
                        return null;
                      }
                    },
                    keyboardType: TextInputType.text ,
                    style: new TextStyle(
                      fontFamily: "Poppins",
                    ),
                  ),
                ),
                new Container(
                  height: 100.0,
                ),
                new FlatButton(onPressed: (){},
                    child: Text('update',
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
