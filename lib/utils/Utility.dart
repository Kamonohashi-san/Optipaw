import 'dart:typed_data';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';

class Utility {
  static const String IMG_KEY = 'img_key';

  static Future<bool> saveImage(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(IMG_KEY, value);
  }

  static Future<String?> getImage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(IMG_KEY);
  }

  static String base64String(Uint8List data) {
    return base64Encode(data);
  }

  static Image imageFromBase64String(String base64String) {
    return Image.memory(base64Decode(base64String), fit: BoxFit.fill);
  }
}
