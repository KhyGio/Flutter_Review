import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Favorite cards"),
      ),
      body: Column(children: [
        Card(title: 'Linux', description: 'The Goat OS'),
        Card(title: 'Window', description: 'The RAM OS'),
        Card(title: 'MAC', description: 'The Fancy OS'),
        ]
      ),
    ),
  ),
);

class Card extends StatefulWidget {
  const Card({super.key, required this.title, required this.description});
  final String title;
  final String description;

  @override
  State<Card> createState() => _CardState();
}

class _CardState extends State<Card> {
  bool isSelect = false;

  void onPress() {
    setState(() {
      isSelect = !isSelect;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(width: .5, color: Colors.grey)),
      ),
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(widget.description),
              ],
            ),
          ),
          IconButton(
            onPressed: () => onPress(),
            icon: isSelect
                ? Icon(Icons.favorite, color: Colors.red)
                : Icon(Icons.favorite_border, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
