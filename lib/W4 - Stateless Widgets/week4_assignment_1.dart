import 'package:flutter/material.dart';

enum Type { Primary, Secondary, Disable }

enum Position { Left, Right }

class HobbyCard extends StatelessWidget {
  const HobbyCard({
    super.key,
    required this.icon,
    required this.text,
    this.position = Position.Left,
    this.type = Type.Primary,
  });

  final String text;
  final Icon icon;
  final Position position;
  final Type type;

  Color getColor() {
    switch (type) {
      case Type.Primary:
        return Colors.blue;

      case Type.Secondary:
        return Colors.green;

      case Type.Disable:
        return Colors.grey;
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: getColor(),
        borderRadius: BorderRadius.circular(20),
      ),

      child: Row(
        children: position == Position.Left
            ? [
                icon,
                SizedBox(width: 20),
                Text(text, style: TextStyle(color: Colors.white, fontSize: 24)),
              ]
            : [
                Text(text, style: TextStyle(color: Colors.white, fontSize: 24)),
                SizedBox(width: 20),
                icon,
              ],
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: Text('My Hobbies'),
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: [
            HobbyCard(
              icon: Icon(Icons.check, color: Colors.white),
              type: Type.Primary,
              text: 'Submit',
              position: Position.Left,
            ),
            HobbyCard(
              icon: Icon(Icons.skateboarding, color: Colors.white),
              type: Type.Secondary,
              text: 'Time',
              position: Position.Right,
            ),
            HobbyCard(
              icon: Icon(Icons.account_tree_sharp, color: Colors.white),
              type: Type.Disable,
              text: 'Account',
              position: Position.Right,
            ),
          ],
        ),
      ),
    ),
  );
}
