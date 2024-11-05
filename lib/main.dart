import 'package:flutter/material.dart';

void main() {
  runApp(stopwatch());
}

class stopwatch extends StatelessWidget {
  const stopwatch({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stopwatch',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: stopwatchPage(),
    );
  }
}

class stopwatchPage extends StatefulWidget {
  const stopwatchPage({super.key});

  @override
  stopwatchPageState createState() => stopwatchPageState();
}

class stopwatchPageState extends State<stopwatchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stopwatch')),
      body: Center(
        child: Row(
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
      ),
    );
  }
}
