import 'package:flutter/material.dart';

class Fans extends StatefulWidget {
  const Fans({super.key});

  @override
  State<Fans> createState() => _FansState();
}

class _FansState extends State<Fans> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text("Fans"), backgroundColor: Colors.blue.shade200),
    );
  }
}
