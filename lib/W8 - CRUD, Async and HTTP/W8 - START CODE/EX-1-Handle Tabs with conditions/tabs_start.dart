import 'package:flutter/material.dart';

class GreenScreen extends StatelessWidget {
  const GreenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Center(child: Text("Green Screen")),
    );
  }
}

class RedScreen extends StatelessWidget {
  const RedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Center(child: Text("Green Screen")),
    );
  }
}

class BlueScreen extends StatelessWidget {
  const BlueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(child: Text("Green Screen")),
    );
  }
}

enum AppTabs { red, green, blue }

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  AppTabs _isSelect = AppTabs.red;

  Widget getScreen() {
    switch (_isSelect) {
      case AppTabs.red:
        return RedScreen();
      case AppTabs.blue:
        return BlueScreen();
      case AppTabs.green:
        return GreenScreen();
    }
  }

  void _select(AppTabs tap) {
    setState(() {
      _isSelect = tap;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tabs navigation")),
      body: getScreen(),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(onPressed: () => _select(AppTabs.red)
            , icon: Icon(Icons.home, color: Colors.red,)
            ),
            IconButton(onPressed: () => _select(AppTabs.blue)
            , icon: Icon(Icons.home, color: Colors.blue,)
            ),
            IconButton(onPressed: () => _select(AppTabs.green)
            , icon: Icon(Icons.home, color: Colors.green,)
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: App()));
}
