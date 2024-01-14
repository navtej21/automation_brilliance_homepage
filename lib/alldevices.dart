import 'package:flutter/material.dart';

class AllDevices extends StatefulWidget {
  const AllDevices({Key? key}) : super(key: key);

  @override
  State<AllDevices> createState() => _AllDevicesState();
}

class _AllDevicesState extends State<AllDevices> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text(
          "All Devices",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
