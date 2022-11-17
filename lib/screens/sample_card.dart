import 'package:flutter/material.dart';
class SampleCardPage extends StatelessWidget {
  const SampleCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(child: Text('Welcome'))
        ),
      );
  }
}