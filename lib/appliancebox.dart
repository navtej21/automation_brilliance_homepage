import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Appliance extends StatefulWidget {
  final String devicename;
  final String iconpath;
  final bool poweron;
  void Function(bool)? onchanged;
  Appliance(
      {super.key,
      required this.devicename,
      required this.iconpath,
      required this.poweron,
      required this.onchanged});

  @override
  State<Appliance> createState() => _ApplianceState();
}

class _ApplianceState extends State<Appliance> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: widget.poweron
              ? Colors.grey[900]
              : Color.fromARGB(44, 164, 167, 189),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // icon
              Image.asset(
                widget.iconpath,
                height: 65,
                color: widget.poweron ? Colors.white : Colors.grey.shade700,
              ),

              // smart device name + switch
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: Text(
                        widget.devicename,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: widget.poweron ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                  CupertinoSwitch(
                      value: widget.poweron, onChanged: widget.onchanged)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
