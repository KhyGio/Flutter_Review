import 'package:flutter/material.dart';

class Title extends StatelessWidget {
  const Title({super.key, required this.color, required this.text});
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Center(
        child: Text(text, style: TextStyle(color: Colors.white, fontSize: 40)),
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: Container(
        padding: EdgeInsets.all(50),
        child: Column(
          children: [
            Title(color: Colors.blue[100]!, text: 'OOP'),
            SizedBox(height: 20),
            Title(color: Colors.blue[300]!, text: 'Dart'),
            SizedBox(height: 20),
            Title(color: Colors.blue[600]!, text: 'Flutter'),
          ],
        ),
      ),
    ),
  );
}
