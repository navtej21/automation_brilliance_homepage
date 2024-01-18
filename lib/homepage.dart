// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:automation_brilliance_homepage/HomeScreen.dart';
import 'package:automation_brilliance_homepage/alldevices.dart';
import 'package:automation_brilliance_homepage/allroomdevices.dart';
import 'package:automation_brilliance_homepage/chatbot.dart';
import 'package:automation_brilliance_homepage/dropdownlist.dart';
import 'package:automation_brilliance_homepage/notifications.dart';
import 'package:automation_brilliance_homepage/voltmeter.dart';
import 'package:automation_brilliance_homepage/workingdevices.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List mySmartDevices = [
    ["Fan", "lib/uimage/fan.png", false],
    ["Light", "lib/uimage/light-bulb.png", false],
    ["TV", "lib/uimage/smart-tv.png", false],
    ["AC", "lib/uimage/air-conditioner.png", false]
  ];

  String dropdownValue = 'Settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "My Home",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28.0,
                  ),
                ),
                DropdownButton<String>(
                  value: dropdownValue,
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      setState(() {
                        dropdownValue = newValue;
                        // Handle navigation based on the selected dropdown option
                        if (newValue == 'Settings') {
                          // Navigate to the Settings page
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SettingsPage()),
                          );
                        } else if (newValue == 'Reports') {
                          // Navigate to the Reports page
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ReportsPage()),
                          );
                        }
                      });
                    }
                  },
                  items: <String>['Settings', 'Reports']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Chatbot()),
                        );
                      },
                      child: Icon(
                        Icons.assistant,
                        size: 28.0,
                      ),
                    ),
                    SizedBox(width: 16.0),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => notifications(),
                          ),
                        );
                      },
                      child: Icon(
                        Icons.notifications,
                        size: 28.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 25),
          EvStateWidget(),
          SizedBox(height: 25),
          Text(
            "Working Devices",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28.0,
              color: Colors.white,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Working(),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: mySmartDevices.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemBuilder: (context, index) {
                  return Devices(
                    devicename: mySmartDevices[index][0],
                    iconpath: mySmartDevices[index][1],
                  );
                },
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
              width: 600,
              height: 600,
              color: Colors.orange.shade200,
              child: Rooms()),
        ],
      ),
    );
  }
}
