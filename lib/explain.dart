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
        await Future.delayed(const Duration(milliseconds: 100));
        setState(() {
          calculatedTime += const Duration(milliseconds: 100);
        });
      }
    }
  }

  // Stops the timer by setting isRunning to false, which exits the loop in startTimer.
  void stopTimer() {
    setState(() {
      isRunning = false;
    });
  }

  // Resets the timer by stopping it and setting the time back to zero.
  void resetTimer() {
    stopTimer(); // Calls stopTimer to ensure the timer is stopped.
    setState(() {
      calculatedTime = Duration.zero; // Resets the time to zero.
    });
  }

  // Formats the calculatedTime into a string as mm:ss:ms format for display.
  String formatTime(Duration calculatedTime) {
    final minutes = calculatedTime.inMinutes
        .toString()
        .padLeft(2, '0'); // Pads minutes to 2 digits.
    final seconds = (calculatedTime.inSeconds % 60)
        .toString()
        .padLeft(2, '0'); // Pads seconds to 2 digits.
    final milliseconds = (calculatedTime.inMilliseconds % 1000 ~/ 10)
        .toString()
        .padLeft(2, '0'); // Pads ms to 2 digits.
    return '$minutes:$seconds:$milliseconds';
  }

  @override
  Widget build(BuildContext context) {
    // Sets the background color based on whether the stopwatch is running (green) or stopped (red).
    Color backgroundColor = isRunning ? Colors.green : Colors.red;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Stopwatch'), // Title in the app bar.
        backgroundColor: backgroundColor, // Background color of the app bar.
      ),
      backgroundColor: backgroundColor, // Background color of the page.
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment
              .center, // Centers the stopwatch text and buttons vertically.
          children: [
            Text(
              formatTime(calculatedTime), // Shows the formatted time.
              style: const TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: Colors.white), // Text style.
            ),
            const SizedBox(height: 30), // Spacing between the time and buttons.
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Centers the buttons horizontally.
              children: [
                ElevatedButton(
                  onPressed: startTimer, // Starts the stopwatch.
                  child: const Text('Start'),
                ),
                const SizedBox(width: 20), // Spacing between buttons.
                ElevatedButton(
                  onPressed: stopTimer, // Stops the stopwatch.
                  child: const Text('Stop'),
                ),
                const SizedBox(width: 20), // Spacing between buttons.
                ElevatedButton(
                  onPressed: resetTimer, // Resets the stopwatch.
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
