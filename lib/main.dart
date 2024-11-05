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
  _stopwatchPageState createState() => _stopwatchPageState();
}

class _stopwatchPageState extends State<stopwatchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stopwatch')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Start functionality will be added here
          },
          child: Text('Start'),
        ),
      ),
    );
  }
}
