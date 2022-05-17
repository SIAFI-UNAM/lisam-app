import 'package:flutter/material.dart';

void main() => runApp(const LisamDemoApp());

class LisamDemoApp extends StatelessWidget {
  const LisamDemoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('LISAM'),
        ),
        body: const Center(
          child: Text('Demo app'),
        ),
      ),
    );
  }
}
