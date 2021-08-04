import 'dart:async';

import 'package:flutter/material.dart';
import 'package:timerapp/TimerScreen.dart';

enum Choices { Second, Minute, Hour }

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var value;
  Choices? _choice = Choices.Second;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: Text('Epic Timer'),
        ),
        body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 50),
                  alignment: Alignment.center,
                  child: Text(
                    'Epic Timer!',
                    style: TextStyle(fontSize: 50, color: Colors.amber),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                  child: TextField(
                    onChanged: (text) {
                      value = text;
                    },
                    decoration: InputDecoration(
                        hintText: "Enter the time in seconds",
                        hintStyle: TextStyle(color: Colors.white)),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ListTile(
                      title: Text(
                        'Seconds',
                        style: TextStyle(color: Colors.white),
                      ),
                      leading: Radio<Choices>(
                        groupValue: _choice,
                        value: Choices.Second,
                        onChanged: (value) {
                          setState(() {
                            _choice = value;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'Minutes',
                        style: TextStyle(color: Colors.white),
                      ),
                      leading: Radio<Choices>(
                        groupValue: _choice,
                        value: Choices.Minute,
                        onChanged: (value) {
                          setState(() {
                            _choice = value;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'Hours',
                        style: TextStyle(color: Colors.white),
                      ),
                      leading: Radio<Choices>(
                        groupValue: _choice,
                        value: Choices.Hour,
                        onChanged: (value) {
                          setState(() {
                            _choice = value;
                          });
                        },
                      ),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 120, vertical: 50),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.white),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TimerScreen(
                                      time: value,
                                      type: _choice,
                                    )));
                      },
                      child: Text(
                        'Start Timer!',
                        style: TextStyle(color: Colors.black),
                      )),
                ),
              ]),
        ));
  }
}
