import 'dart:convert';

import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:iss_locator/models/location.dart';

class IssLocator {
  IssLocator._private();

  static IssLocator instance = IssLocator._private();

  late Position position;

  Future<void> initialize() async {
    await currentLocation();
  }

  Future<void> currentLocation() async {
    http.Request request = http.Request(
      'GET',
      Uri.parse('http://api.open-notify.org/iss-now.json'),
    );

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      Map json = jsonDecode(await response.stream.bytesToString());
      position = Position.fromJson(json['iss_position']);
    } else {
      debugPrint(response.reasonPhrase);
    }
  }
}
