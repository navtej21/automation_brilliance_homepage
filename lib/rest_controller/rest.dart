import 'dart:convert';
import 'dart:ffi';

import 'package:http/http.dart' as http;

Future<void> switchdata(bool value) async {
  final url = Uri.https(
      'automationbrilliance-161c1-default-rtdb.firebaseio.com', 'switch.json');
  final response = await http.put(url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'switch': value}));

  if (response.statusCode == 200) {
    print("success");
  } else {
    print("failure");
  }

  return null; // Add this line to fix the error
}
