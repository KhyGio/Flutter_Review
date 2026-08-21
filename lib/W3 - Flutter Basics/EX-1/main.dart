import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(
            'Hello, Gio.',
            style: TextStyle(color: Colors.amber, fontSize: 50),
          ),
        ),
      ),
    ),
  );
}
