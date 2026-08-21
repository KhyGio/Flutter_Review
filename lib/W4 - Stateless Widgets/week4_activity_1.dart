import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Column(
        children: [
          const SizedBox(height: 100),
          Container(color: Colors.blue, height: 400),
          SizedBox(
            height: 100,
            child: Row(
              children: [
                Expanded(child: Container(color: Colors.green)),
                Container(color: Colors.pink, width: 100),
              ],
            ),
          ),
          SizedBox(
            height: 100,
            child: Row(
              children: [
                Expanded(child: Container(color: Colors.yellow)),
                const SizedBox(width: 20),
                Expanded(child: Container(color: Colors.yellow)),
                const SizedBox(width: 20),
                Expanded(child: Container(color: Colors.yellow)),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(child: Container(color: Colors.pink)),
        ],
      ),
    ),
  );
}
