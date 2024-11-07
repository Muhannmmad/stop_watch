import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const StopwatchApp());
}

class StopwatchApp extends StatelessWidget {
  const StopwatchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stopwatch',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const StopwatchPage(),
    );
  }
}

class StopwatchPage extends StatefulWidget {
  const StopwatchPage({super.key});

  @override
  StopwatchPageState createState() => StopwatchPageState();
}

class StopwatchPageState extends State<StopwatchPage> {
  Duration calculatedTime = Duration.zero;
  bool isRunning = false;

  Future<void> startTimer() async {
    if (!isRunning) {
      setState(() {
        isRunning = true;
      });
      while (isRunning) {
        await Future.delayed(const Duration(milliseconds: 10));
        setState(() {
          calculatedTime += const Duration(milliseconds: 10);
        });
      }
    }
  }

  void stopTimer() {
    setState(() {
      isRunning = false;
    });
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

    Color backgroundColor = isRunning ? Colors.green : Colors.red;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Stopwatch'),
        backgroundColor: backgroundColor,
      ),
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              formattedTime,
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: startTimer,
                  child: const Text('Start'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: stopTimer,
                  child: const Text('Stop'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: resetTimer,
                  child: const Text('Reset'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
