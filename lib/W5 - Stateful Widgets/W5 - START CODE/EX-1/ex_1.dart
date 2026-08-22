import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: const Text("Custom buttons")),
      body: Center(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(10),
              child: const Bottun(),
            );
          },
        ),
      ),
    ),
  ),
);

class Bottun extends StatefulWidget {
  const Bottun({super.key});

  @override
  State<Bottun> createState() => _BottunState();
}

class _BottunState extends State<Bottun> {
  bool isSelect = false;

  void onPress() {
    setState(() {
      isSelect = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPress(),
      style: isSelect
          ? ElevatedButton.styleFrom(backgroundColor: Colors.blue)
          : ElevatedButton.styleFrom(backgroundColor: Colors.white),
      child: isSelect
          ? Center(child: Text("Selected"))
          : Center(child: Text("Not Selected")),
    );
  }
}
