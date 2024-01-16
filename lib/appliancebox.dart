import 'package:flutter/material.dart';

class Appliance extends StatelessWidget {
  final String devicename;
  final String iconpath;
  final bool poweron;
  const Appliance(
      {super.key,
      required this.devicename,
      required this.iconpath,
      required this.poweron});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [Image.asset(iconpath)],
    ));
  }
}
