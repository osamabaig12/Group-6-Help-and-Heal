import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'period tracker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color.fromRGBO(81, 200, 196, 1.0),
        accentColor: Colors.white,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CalendarController _controller;
  Map<DateTime, List<dynamic>> _events;
  TextEditingController _eventController;

  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
    _eventController = TextEditingController();
    _events = {};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('period tracker',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            color: Theme.of(context).accentColor,
          ),
        ),
        leading: Icon(Icons.arrow_back),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TableCalendar(
              events: _events,
              initialCalendarFormat: CalendarFormat.month,

              calendarStyle: CalendarStyle(
                  canEventMarkersOverflow: true,
                  todayColor: Theme.of(context).primaryColor,
                  selectedColor: Color.fromRGBO(81, 200, 196, 0.5),
                  todayStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Theme.of(context).accentColor)
              ),

              headerStyle: HeaderStyle(
                centerHeaderTitle: true,
                formatButtonVisible: false,
              ),
              startingDayOfWeek: StartingDayOfWeek.monday,

              builders: CalendarBuilders(
                selectedDayBuilder: (context, date, events) => Container(
                    margin: const EdgeInsets.all(4.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(81, 200, 196, 0.5),
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Text(
                      date.day.toString(),
                      style: TextStyle(color: Theme.of(context).accentColor),
                    )),
                todayDayBuilder: (context, date, events) => Container(
                    margin: const EdgeInsets.all(4.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(81, 200, 196, 1.0),
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Text(
                      date.day.toString(),
                      style: TextStyle(color: Theme.of(context).accentColor),
                    )),
              ),
              calendarController: _controller,
            ),  //might have to remove comma
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add,color: Theme.of(context).accentColor,),
        onPressed: _showAddDialog,
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }

  _showAddDialog() async {
    await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: TextField(
            controller: _eventController,
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("Save",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor
                  )
              ),
              onPressed: () {

                if (_eventController.text.isEmpty) return;
                if (_events[_controller.selectedDay] != null) {
                  _events[_controller.selectedDay]
                      .add(_eventController.text);
                }
                else {
                  _events[_controller.selectedDay] = [
                    _eventController.text
                  ];


                }
                _eventController.clear();
                Navigator.pop(context);
              },
            )
          ],
        ));
  }
}