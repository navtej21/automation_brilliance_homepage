// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:automation_brilliance_homepage/appliancebox.dart';
import 'package:flutter/material.dart';

class Rooms extends StatefulWidget {
  const Rooms({Key? key}) : super(key: key);

  @override
  State<Rooms> createState() => _RoomsState();
}

class _RoomsState extends State<Rooms> {
  @override
  Widget build(BuildContext context) {
    List mySmartDevices = [
      ["Fan", "lib/uimage/fan.png", true],
      ["Light", "lib/uimage/light-bulb.png", false],
      ["TV", "lib/uimage/smart-tv.png", false],
      ["AC", "lib/uimage/air-conditioner.png", false]
    ];

    List kitchendevices = [
      ["Fan", "lib/uimage/fan.png", true],
      ["Light", "lib/uimage/light-bulb.png", false]
    ];

    List bathroomdevices = [
      ["Fan", "lib/uimage/fan.png", true],
      ["Light", "lib/uimage/light-bulb.png", false]
    ];

    void powerswitchchanged(bool value, int index) {
      setState(() {
        mySmartDevices[index][2] = !value;
      });
    }

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.orange.shade100,
        appBar: AppBar(
          title: Text(
            "All Rooms And Devices",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 28.0,
            ),
          ),
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
            GridView.builder(
              itemCount: 4,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 25),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 1.3,
              ),
              itemBuilder: (context, index) {
                return Appliance(
                  devicename: mySmartDevices[index][0],
                  iconpath: mySmartDevices[index][1],
                  poweron: mySmartDevices[index][2],
                  onchanged: (value) {
                    powerswitchchanged(!value, index);
                  },
                );
              },
            ),
            // Content for Bedroom
            GridView.builder(
              itemCount: 4,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 25),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 1.3,
              ),
              itemBuilder: (context, index) {
                return Appliance(
                  devicename: mySmartDevices[index][0],
                  iconpath: mySmartDevices[index][1],
                  poweron: mySmartDevices[index][2],
                  onchanged: (value) {
                    powerswitchchanged(value, index);
                  },
                );
              },
            ),
            // Content for Kitchen
            GridView.builder(
              itemCount: 2,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 25),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 1.3,
              ),
              itemBuilder: (context, index) {
                return Appliance(
                  devicename: kitchendevices[index][0],
                  iconpath: mySmartDevices[index][1],
                  poweron: mySmartDevices[index][2],
                  onchanged: (value) {
                    powerswitchchanged(!value, index);
                  },
                );
              },
            ),

            GridView.builder(
              itemCount: 2,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 25),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 1.3,
              ),
              itemBuilder: (context, index) {
                return Appliance(
                  devicename: bathroomdevices[index][0],
                  iconpath: mySmartDevices[index][1],
                  poweron: mySmartDevices[index][2],
                  onchanged: (value) {
                    powerswitchchanged(!value, index);
                  },
                );
              },
            )
            // Content for Bathroom
          ],
        ),
      ),
    );
  }
}
