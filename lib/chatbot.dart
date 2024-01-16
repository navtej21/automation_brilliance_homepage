import 'package:flutter/material.dart';

class Chatbot extends StatelessWidget {
  const Chatbot({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade100,
        title: Text("ChatBot"),
      ),
    );
  }
}
