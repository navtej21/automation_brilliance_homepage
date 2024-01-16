import 'package:flutter/material.dart';

class VoiceScreen extends StatelessWidget {
  const VoiceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade100,
        title: Text("VoiceAssistant"),
      ),
    );
  }
}
