import 'package:flutter/material.dart';

class Working extends StatelessWidget {
  const Working({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.blue.shade200,
            title: Text("Working Devices")));
  }
}
