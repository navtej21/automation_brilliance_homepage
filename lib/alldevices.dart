import 'package:flutter/material.dart';

class Devices extends StatelessWidget {
  final String devicename;
  final String iconpath;

  // Corrected constructor
  const Devices({Key? key, required this.devicename, required this.iconpath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [Image.asset(iconpath, height: 45), Text(devicename)],
    ));
  }
}
