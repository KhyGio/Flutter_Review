import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(title: 'My App', home: Counter()));
}

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int count = 0;

  void increase() {
    setState(() {
      count += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Text(
                'Greate Counter',
                style: TextStyle(color: Colors.blue, fontSize: 48),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Current value: $count',
                style: TextStyle(color: Colors.grey, fontSize: 24),
              ),
            ),
            TextButton(
              onPressed: increase,
              style: TextButton.styleFrom(
                foregroundColor: Colors.grey,
                textStyle: TextStyle(color: Colors.blue, fontSize: 12),
              ),
              child: const Text('Increment'),
            ),
          ],
        ),
      ),
    );
  }
}
