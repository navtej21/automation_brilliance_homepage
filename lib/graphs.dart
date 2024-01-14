import 'package:flutter/material.dart';

class Graphs extends StatelessWidget {
  const Graphs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Daily Consumption",
                style: TextStyle(fontWeight: FontWeight.bold)),
            backgroundColor: Colors.blue.shade50));
  }
}
