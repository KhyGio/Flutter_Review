import 'package:flutter/material.dart';
import 'joke.dart';


Color appColor = Colors.green.shade300;

void main() {
  runApp(
    const MaterialApp(
      home: FavoriteJokes(),
    ),
  );
}

class FavoriteJokes extends StatefulWidget {
  const FavoriteJokes({super.key});

  @override
  State<FavoriteJokes> createState() => _FavoriteJokesState();
}

class _FavoriteJokesState extends State<FavoriteJokes> {
  int? favoriteIndex;

  void onFavoriteClick(int index) {
    setState(() {
      if (favoriteIndex == index) {
        favoriteIndex = null;
      } else {
        favoriteIndex = index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: appColor,
        title: const Text('Favorite Jokes'),
      ),

      body: ListView.builder(
        itemCount: jokes.length,
        itemBuilder: (context, index) {
          return FavoriteCard(
            joke: jokes[index],
            isFavorite: favoriteIndex == index,
            onFavoriteClick: () {
              onFavoriteClick(index);
            },
          );
        },
      ),
    );
  }
}