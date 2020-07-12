import 'package:flutter/material.dart';
import 'package:TaskMarker/screens/home_screen.dart';

void main() => runApp(TaskMarker());

class TaskMarker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
