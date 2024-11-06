import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(StopwatchApp());
}

class StopwatchApp extends StatelessWidget {
  const StopwatchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stopwatch',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: StopwatchPage(),
    );
  }
}

class StopwatchPage extends StatefulWidget {
  const StopwatchPage({super.key});

  @override
  StopwatchPageState createState() => StopwatchPageState();
}

class StopwatchPageState extends State<StopwatchPage> {
  Timer? timer;
  Duration calculatedTime = Duration.zero;
  bool isRunning = false;

  void startTimer() {
    if (!isRunning) {
      isRunning = true;
      timer = Timer.periodic(Duration(milliseconds: 10), (timer) {
        setState(() {
          calculatedTime += Duration(milliseconds: 10);
        });
      });
    }
  }

  void stopTimer() {
    if (isRunning) {
      timer?.cancel();
      isRunning = false;
    }
  }

  void resetTimer() {
    stopTimer();
    setState(() {
      calculatedTime = Duration.zero;
    });
  }

  @override
  Widget build(BuildContext context) {
    String formattedTime =
        '${calculatedTime.inMinutes.toString().padLeft(2, '0')}:'
        '${(calculatedTime.inSeconds % 60).toString().padLeft(2, '0')}:'
        '${(calculatedTime.inMilliseconds % 1000 ~/ 10).toString().padLeft(2, '0')}';

    return Scaffold(
      appBar: AppBar(title: Text('Stopwatch')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              formattedTime,
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Start'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Stop'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Reset'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
