// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class Rooms extends StatelessWidget {
  const Rooms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.orange.shade100,
        appBar: AppBar(
          title: Text("All Rooms And Devices",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 28.0)),
          backgroundColor: Colors.orange.shade100,
          bottom: TabBar(
            isScrollable: false,
            tabs: [
              Tab(text: "Living Room"),
              Tab(text: "Bedroom"),
              Tab(text: "Kitchen"),
              Tab(text: "Bathroom"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Content for Living Room
            Center(child: Text("Content for Living Room")),
            // Content for Bedroom
            Center(
              child: Text("Content for Bedroom"),
            ),
            // Content for Kitchen
            Center(
              child: Text("Content for Kitchen"),
            ),
            // Content for Bathroom
            Center(
              child: Text("Content for Bathroom"),
            ),
          ],
        ),
      ),
    );
  }
}
