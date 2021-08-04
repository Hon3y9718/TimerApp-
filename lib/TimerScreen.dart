import 'dart:async';

import 'package:flutter/material.dart';
import 'package:timerapp/Home.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({Key? key, required this.time, required this.type})
      : super(key: key);

  final time;
  final type;

  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  var maxSeconds = 60;
  var seconds = 0;
  var isStarted = false;

  Timer? timer;

  void startTimerSeconds() {
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (seconds <= 0) {
        stopTimer();
      } else {
        setState(() {
          --seconds;
        });
      }
    });
  }

  void startTimerMinute() {
    timer = Timer.periodic(Duration(minutes: 1), (_) {
      if (seconds <= 0) {
        stopTimer();
      } else {
        setState(() {
          --seconds;
        });
      }
    });
  }

  void startTimerHour() {
    timer = Timer.periodic(Duration(hours: 1), (_) {
      if (seconds <= 0) {
        stopTimer();
      } else {
        setState(() {
          --seconds;
        });
      }
    });
  }

  void stopTimer() {
    timer?.cancel();
  }

  void resetTimer() {
    stopTimer();
    setState(() {
      maxSeconds = widget.time;
      seconds = maxSeconds;
      isStarted = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    maxSeconds = int.parse(widget.time);
    seconds = int.parse(widget.time);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text('Timer'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 200,
            width: 200,
            child: Stack(
              children: [
                SizedBox(
                  height: 200,
                  width: 200,
                  child: CircularProgressIndicator(
                    value: seconds / maxSeconds,
                    strokeWidth: 12,
                    backgroundColor: Colors.white,
                    valueColor: AlwaysStoppedAnimation(Colors.green),
                  ),
                ),
                Center(
                  child: Text(
                    '${seconds}',
                    style: TextStyle(
                        fontSize: 80,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 50),
            child: isStarted
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          style:
                              ElevatedButton.styleFrom(primary: Colors.white),
                          onPressed: stopTimer,
                          child: Text(
                            'Pause',
                            style: TextStyle(color: Colors.black),
                          )),
                      ElevatedButton(
                          style:
                              ElevatedButton.styleFrom(primary: Colors.white),
                          onPressed: resetTimer,
                          child: Text(
                            'Reset',
                            style: TextStyle(color: Colors.black),
                          )),
                    ],
                  )
                : ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.white),
                    onPressed: () {
                      setState(() {
                        isStarted = true;
                      });
                      widget.type == Choices.Minute
                          ? startTimerMinute()
                          : widget.type == Choices.Hour
                              ? startTimerHour()
                              : startTimerSeconds();
                    },
                    child: Text(
                      'Start Timer!',
                      style: TextStyle(color: Colors.black),
                    )),
          )
        ],
      ),
    );
  }
}
