// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:automation_brilliance_homepage/HomePage.dart';
import 'package:automation_brilliance_homepage/PowerConsumptionGraph.dart';
import 'package:flutter/material.dart';

class EvStateWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => (Graphs())));
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          padding: EdgeInsets.all(16.0),
          width: double.infinity,
          height: 145,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [const Color.fromARGB(255, 159, 33, 243), Colors.blue],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 4.0,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Voltage: 220.0 V',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'Current: 15 A',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'Total Power: 3000.0 W',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
