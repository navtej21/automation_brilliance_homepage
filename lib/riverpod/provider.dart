import 'package:automation_brilliance_homepage/AllRoomDevices.dart';
import 'package:automation_brilliance_homepage/allroomdevices.dart';
import 'package:automation_brilliance_homepage/rest_controller/rest.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:automation_brilliance_homepage/firebase_options.dart';

import 'package:http/http.dart' as http;

class RoomState extends ChangeNotifier {
  List<List<dynamic>> livinroom = [
    ["Fan", "lib/uimage/fan.png", false],
    ["Light", "lib/uimage/light-bulb.png", false],
    ["TV", "lib/uimage/smart-tv.png", false],
    ["AC", "lib/uimage/air-conditioner.png", false]
  ];

  List<List<dynamic>> bedroom = [
    ["Fan", "lib/uimage/fan.png", false],
    ["Light", "lib/uimage/light-bulb.png", false],
    ["TV", "lib/uimage/smart-tv.png", false],
    ["AC", "lib/uimage/air-conditioner.png", false]
  ];

  List kitchendevices = [
    ["Fan", "lib/uimage/fan.png", false],
    ["Light", "lib/uimage/light-bulb.png", false]
  ];

  List bathroomdevices = [
    ["Fan", "lib/uimage/fan.png", false],
    ["Light", "lib/uimage/light-bulb.png", false]
  ];

  void togglelivingDevice(bool value, int index) async {
    livinroom[index][2] = value;
    await switchdata(value);
    notifyListeners();
  }

  void togglebedroomDevice(bool value, int index) {
    bedroom[index][2] = value;
    print(bedroom[index][2]);
    notifyListeners();
  }

  void togglekitchenDevice(bool value, int index) {
    kitchendevices[index][2] = value;
    print(kitchendevices[index][2]);
    notifyListeners();
  }

  void togglebathroomDevice(bool value, int index) {
    bathroomdevices[index][2] = value;
    print(bathroomdevices[index][2]);
    notifyListeners();
  }
}
