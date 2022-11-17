import 'package:flutter/material.dart';

class BrowsingPage extends StatelessWidget {
  const BrowsingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(child: Text('Browsing Songs'))
        ),
      );
  }
}