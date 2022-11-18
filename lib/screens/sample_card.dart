import 'package:flutter/material.dart';

import 'package:project_two/models/practice.dart';

class SamplePage extends StatelessWidget {
  final Songs songs;
  SamplePage(  this.songs, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(songs.url),
            const SizedBox(height: 8,),
            Text(songs.name.toString().toUpperCase()),
             const SizedBox(height: 8,),
            Text(songs.category)
          ],
        ),
      ),
    );
  }
}