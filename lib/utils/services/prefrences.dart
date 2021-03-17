import 'dart:async' show Future;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static SharedPreferences? _prefsInstance;
  static Future<SharedPreferences> get _instance async => _prefsInstance ??
      await SharedPreferences.getInstance(); // shared prefrences singleton


  // call this method early in the app .. ideally on splash screen
  static Future<void> init() async {
    _prefsInstance = await _instance;
    // any other specific logic for initalizing goes here
  }

  static Color getColor(String key) {
    int? colorInt = _prefsInstance?.getInt(key);
    return  Color(colorInt ?? Colors.transparent.value );
  }

  static Future<bool> setColor(String key, Color color) async {
    var prefs = await _instance;
    return prefs.setInt(key, color.value);
  }

  static Future<bool> setDate(String key, DateTime date) async {
    return await setString(key, date.toString());
  }

  static DateTime getDate(String key) {
    return DateTime.parse(getString(key));
  }

  static String getString(String key, [String? defValue]) {
    return _prefsInstance?.getString(key) ?? defValue ?? ''; // null aware 
  }

  static Future<bool> setString(String key, String value) async {
    // ignore: omit_local_variable_types
    SharedPreferences prefs = await _instance;
    return prefs.setString(key, value); // null aware 
  }

  static int getInt(String key,int defValue) {
    return _prefsInstance?.getInt(key) ?? defValue; // null aware 
  }

  static Future<bool> setInt(String key, int value) async {
    var prefs = await _instance;
    return prefs.setInt(key, value);
  }

  static bool getBool(String key) {
    return _prefsInstance?.getBool(key) ?? true;
  }

  static Future<bool> setBool(String key, bool value) async {
    var prefs = await _instance;
    return prefs.setBool(key, value);
  }
}
