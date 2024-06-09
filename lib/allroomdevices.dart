// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:automation_brilliance_homepage/appliancebox.dart';
import 'package:automation_brilliance_homepage/riverpod/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Rooms extends StatefulWidget {
  const Rooms({Key? key}) : super(key: key);

  @override
  State<Rooms> createState() => _RoomsState();
}

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

class _RoomsState extends State<Rooms> {
  @override
  Widget build(BuildContext context) {
    void powerswitchchanged(bool value, int index) {
      setState(() {
        mySmartDevices[index][2] = !mySmartDevices[index][2];
      });
    }

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Color.fromARGB(68, 215, 178, 255),
        appBar: AppBar(
          title: Text(
            "All Rooms And Devices",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 28.0,
            ),
          ),
          backgroundColor: Color.fromARGB(68, 215, 178, 255),
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
            Consumer<RoomState>(
              builder: (context, roomstate, child) {
                return GridView.builder(
                  itemCount: roomstate.livinroom.length,
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1.3,
                  ),
                  itemBuilder: (context, index) {
                    return Appliance(
                      devicename: roomstate.livinroom[index][0],
                      iconpath: roomstate.livinroom[index][1],
                      poweron: roomstate.livinroom[index][2],
                      onchanged: (value) =>
                          {roomstate.togglelivingDevice(value, index)},
                    );
                  },
                );
              },
            ),
            // Content for Bedroom
            Consumer<RoomState>(
              builder: (context, roomstate, child) {
                return GridView.builder(
                  itemCount: roomstate.bedroom.length,
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1.3,
                  ),
                  itemBuilder: (context, index) {
                    return Appliance(
                      devicename: roomstate.bedroom[index][0],
                      iconpath: roomstate.bedroom[index][1],
                      poweron: roomstate.bedroom[index][2],
                      onchanged: (value) {
                        roomstate.togglebedroomDevice(value, index);
                      },
                    );
                  },
                );
              },
            ),
            // Content for Kitchen
            Consumer<RoomState>(
              builder: (context, roomstate, child) {
                return GridView.builder(
                  itemCount: 2,
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1.3,
                  ),
                  itemBuilder: (context, index) {
                    return Appliance(
                      devicename: roomstate.kitchendevices[index][0],
                      iconpath: roomstate.kitchendevices[index][1],
                      poweron: roomstate.kitchendevices[index][2],
                      onchanged: (value) {
                        roomstate.togglekitchenDevice(value, index);
                      },
                    );
                  },
                );
              },
            ),

            Consumer<RoomState>(
              builder: (context, roomstate, child) {
                return GridView.builder(
                  itemCount: 2,
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1.3,
                  ),
                  itemBuilder: (context, index) {
                    return Appliance(
                      devicename: roomstate.bathroomdevices[index][0],
                      iconpath: roomstate.bathroomdevices[index][1],
                      poweron: roomstate.bathroomdevices[index][2],
                      onchanged: (value) {
                        roomstate.togglebathroomDevice(value, index);
                      },
                    );
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
