import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

void dismissKeyboard() {
  FocusManager.instance.primaryFocus?.unfocus();
}

class NetworkUtility {
  static Future<String?> fetchUrl(Uri uri,
      {Map<String, String>? headers}) async {
    try {
      final response = await http.get(uri, headers: headers);
      if (response.statusCode == 200) {
        return response.body;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }
}

class Debounce {
  Timer? _timer;
  final Duration delay;

  Debounce({
    this.delay = const Duration(milliseconds: 900),
  });

  void call(Function() callback) {
    _timer?.cancel();
    _timer = Timer(delay, callback);
  }

  void dispose() {
    _timer?.cancel();
    _timer = null;
  }
}

Future<Position> determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;
  permission = await Geolocator.requestPermission();
  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    permission = await Geolocator.requestPermission();

    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);
}


String formatDynamicString(String input) {
  final doubleValue = double.tryParse(input);
  if (doubleValue == null) {
    throw ArgumentError("Invalid input string: $input");
  }

  // If the number is effectively an integer
  if (doubleValue == doubleValue.toInt()) {
    return doubleValue.toInt().toString();
  }

  // Convert to a string and remove trailing zeros
  String formatted = doubleValue.toStringAsFixed(10); // Arbitrary high precision
  formatted = formatted.replaceAll(RegExp(r'0+$'), ''); // Remove trailing zeros
  formatted = formatted.replaceAll(RegExp(r'\.$'), ''); // Remove trailing decimal point

  return formatted;
}
