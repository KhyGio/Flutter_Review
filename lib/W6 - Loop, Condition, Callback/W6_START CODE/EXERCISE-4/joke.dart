import 'package:flutter/material.dart';

class Joke {
  final String title;
  final String description;

  const Joke({required this.title, required this.description});
}

const List<Joke> jokes = [
  Joke(
    title: 'Why did the computer go to the doctor?',
    description: 'Because it had a virus!',
  ),
  Joke(
    title: 'Why was the computer cold?',
    description: 'Because it left its Windows open!',
  ),
  Joke(title: 'What do you call a fake noodle?', description: 'An impasta!'),
  Joke(
    title: 'Why did the programmer quit his job?',
    description: 'Because he did not get arrays!',
  ),
  Joke(
    title: 'Why do programmers prefer dark mode?',
    description: 'Because light attracts bugs!',
  ),
  Joke(
    title: 'Why did the developer go broke?',
    description: 'Because he used up all his cache!',
  ),
  Joke(
    title: 'How do you comfort a JavaScript bug?',
    description: 'You console it!',
  ),
  Joke(
    title: 'Why do Java developers wear glasses?',
    description: 'Because they cannot C#!',
  ),
  Joke(
    title: 'What is a programmer\'s favorite place?',
    description: 'The Foo Bar!',
  ),
  Joke(
    title: 'Why did the function break up with the loop?',
    description: 'It felt too controlled!',
  ),
  Joke(
    title: 'Why was the JavaScript developer sad?',
    description: 'Because he did not know how to "null" his feelings!',
  ),
  Joke(title: 'What do you call 8 hobbits?', description: 'A hobbyte!'),
  Joke(
    title: 'Why do programmers hate nature?',
    description: 'It has too many bugs and no debugger!',
  ),
  Joke(
    title: 'Why did the database administrator leave his wife?',
    description: 'She had one-to-many relationships!',
  ),
  Joke(
    title: 'What is the object-oriented way to become wealthy?',
    description: 'Inheritance!',
  ),
  Joke(
    title: 'Why do programmers always mix up Halloween and Christmas?',
    description: 'Because Oct 31 equals Dec 25!',
  ),
  Joke(
    title: 'Why did the programmer stare at the empty cup?',
    description: 'It said "cup is empty" but he expected an exception!',
  ),
  Joke(
    title: 'What is a Flutter developer\'s favorite drink?',
    description: 'Widget-ade!',
  ),
  Joke(
    title: 'Why did the app crash before the interview?',
    description: 'It was not ready for production!',
  ),
  Joke(
    title: 'How many programmers does it take to change a light bulb?',
    description: 'None, that\'s a hardware problem!',
  ),
];

class FavoriteCard extends StatelessWidget {
  final Joke joke;
  final bool isFavorite;
  final VoidCallback onFavoriteClick;

  const FavoriteCard({
    super.key,
    required this.joke,
    required this.isFavorite,
    required this.onFavoriteClick,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      color: isFavorite ? Colors.green.shade50 : Colors.white,
      elevation: isFavorite ? 4 : 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: isFavorite ? Colors.green.shade300 : Colors.transparent,
          width: 1.5,
        ),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        title: Text(
          joke.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(joke.description),
        ),
        trailing: IconButton(
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: isFavorite ? Colors.red : Colors.grey,
          ),
          onPressed: onFavoriteClick,
        ),
      ),
    );
  }
}
