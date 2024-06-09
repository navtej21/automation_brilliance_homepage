// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:automation_brilliance_homepage/AllWorkingDevices/Camera.dart';
import 'package:automation_brilliance_homepage/AllWorkingDevices/Fans.dart';
import 'package:automation_brilliance_homepage/AllWorkingDevices/Light.dart';
import 'package:automation_brilliance_homepage/AllWorkingDevices/Others.dart';
import 'package:automation_brilliance_homepage/HomeScreen.dart';
import 'package:automation_brilliance_homepage/AllDevices.dart';
import 'package:automation_brilliance_homepage/AllRoomDevices.dart';
import 'package:automation_brilliance_homepage/Chatbot.dart';
import 'package:automation_brilliance_homepage/DropDownList.dart';
import 'package:automation_brilliance_homepage/chatbot/chatbot.dart';
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
    ["Camera", "lib/uimage/camera.png", false],
    ["Others", "lib/uimage/threedots.png", false]
  ];

  String dropdownValue = 'Settings';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 189, 144, 249),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DropdownButton<String>(
                    value: dropdownValue,
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          dropdownValue = newValue;
                          // Handle navigation based on the selected dropdown option
                          if (newValue == 'Settings') {
                            // Navigate to the Reports page
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SettingsPage()),
                            );
                          } else if (newValue == 'Reports') {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ReportsPage()));
                          }
                        });
                      }
                    },
                    items: <String>['Settings', 'Reports', 'My Home']
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
                              MaterialPageRoute(
                                  builder: (context) => Chatbot()),
                            );
                          },
                          child: CircleAvatar(
                              child: Icon(
                            Icons.smart_toy,
                            color: Colors.black,
                          ))),
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
            SizedBox(height: 18),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                "Working Devices",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28.0,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
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
                  return GestureDetector(
                    child: Devices(
                      devicename: mySmartDevices[index][0],
                      iconpath: mySmartDevices[index][1],
                    ),
                    onTap: () {
                      if (index == 0) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Fans()));
                      } else if (index == 1) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Light()));
                      } else if (index == 2) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Camera()));
                      } else if (index == 3) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Others()));
                      }
                      ;
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            Container(width: 600, height: 600, child: Rooms()),
          ],
        ),
      ),
    );
  }
}
