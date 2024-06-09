import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Appliance extends StatefulWidget {
  final String devicename;
  final String iconpath;
  final bool poweron;
  void Function(bool)? onchanged;

  Appliance({
    Key? key,
    required this.devicename,
    required this.iconpath,
    required this.poweron,
    required this.onchanged,
  }) : super(key: key);

  @override
  _ApplianceState createState() => _ApplianceState();
}

class _ApplianceState extends State<Appliance> {
  late bool _isSwitched = false;

  @override
  void initState() {
    super.initState();
    _isSwitched = widget.poweron;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Color.fromARGB(44, 164, 167, 189),
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
                color: Colors.black,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isSwitched = !_isSwitched;
                    if (widget.onchanged != null) {
                      widget.onchanged!(_isSwitched);
                    }
                  });
                },
                // smart device name + switch
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 25.0),
                        child: Text(
                          widget.devicename,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    CupertinoSwitch(
                      value: _isSwitched,
                      onChanged: (value) {
                        setState(() {
                          _isSwitched = value;
                          if (widget.onchanged != null) {
                            widget.onchanged!(_isSwitched);
                          }
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
