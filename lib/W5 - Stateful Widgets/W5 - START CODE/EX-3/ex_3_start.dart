import 'package:flutter/material.dart';

List<String> images = [
  "assets/w4-s2/bird.jpg",
  "assets/w4-s2/bird2.jpg",
  "assets/w4-s2/insect.jpg",
  "assets/w4-s2/girl.jpg",
  "assets/w4-s2/man.jpg",
];

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false, // Why this line ? Can you explain it ?
    home: Dispaly(),
  ),
);

class Dispaly extends StatefulWidget {
  const Dispaly({super.key});

  @override
  State<Dispaly> createState() => _DispalyState();
}

class _DispalyState extends State<Dispaly> {
  int pages = 0;

  void previosImage() {
    setState(() {
      if (pages > 0) {
        pages--;
      }
    });
  }

  void nextImage() {
    setState(() {
      if (pages < 4) {
        pages++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: const Text('Image viewer'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.navigate_before),
            tooltip: 'Go to the previous image',
            onPressed: () => previosImage(),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
            child: IconButton(
              icon: const Icon(Icons.navigate_next),
              tooltip: 'Go to the next image',
              onPressed: () => nextImage(),
            ),
          ),
        ],
      ),
      body: Center(child: Image.asset(images[pages])),
    );
  }
}
