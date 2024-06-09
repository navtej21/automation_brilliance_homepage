// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:automation_brilliance_homepage/AllRoomDevices.dart';
import 'package:automation_brilliance_homepage/VoiceScreen.dart';
import 'package:automation_brilliance_homepage/HomePage.dart';
import 'package:automation_brilliance_homepage/riverpod/Appliance.dart';
import 'package:automation_brilliance_homepage/riverpod/provider.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => RoomState(),
        ),
        ChangeNotifierProvider(
          create: (_) => ApplianceState(),
        )
      ],
      child: MyApp(),
    ),
  );
=======
import 'package:firebase_core/firebase_core.dart';
import 'dart:io';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: 'AIzaSyAcSg5m_3SQsobOqsnYYu1ISPPUL_9V8oo',
              appId: '1:614031730295:android:423b6f43e3c48795dc8872',
              messagingSenderId: '614031730295',
              projectId: 'automation-brilliance-2cebf'))
      : await Firebase.initializeApp();
  runApp(const MyApp());
>>>>>>> e56873bce1e5bdeaabccec20038f55a1cca90498
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const BottomNavigationDemo(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class BottomNavigationDemo extends StatefulWidget {
  const BottomNavigationDemo({Key? key}) : super(key: key);

  @override
  State createState() => _BottomNavigationDemoState();
}

class _BottomNavigationDemoState extends State<BottomNavigationDemo> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    Home(),
    VoiceScreen(),
    SmartScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 35,
              weight: 15,
              color: Color.fromARGB(255, 132, 46, 87),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.mic,
              size: 35,
              weight: 15,
              color: Color.fromARGB(255, 132, 46, 87),
            ),
            label: 'Voice',
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              child: Image.asset("lib/uimage/smart.png"),
              backgroundColor: Color.fromARGB(255, 132, 46, 87),
            ),
            label: 'Smart',
          ),
        ],
      ),
    );
  }
}

class SmartScreen extends StatelessWidget {
  const SmartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade200,
        title: const Text("SmartScreen"),
      ),
    );
  }
}

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
