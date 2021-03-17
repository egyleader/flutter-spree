import 'package:flutter/services.dart' show rootBundle;

// this helper class gives you the access to envieronmental values
// in the .env file ,, this enables you to flavor your app depending on
// differnt dev stages and flavors ..

class Env {
  static Map<String, String> _envMap = {};

  static String? load(String setting) =>
      _envMap.containsKey(setting) ? _envMap[setting] : '';

  static void clear() => _envMap.clear();

// loads the '.env'file as a string and parse it to a map
// ready to get any of them anywhere in the app,,
// call this as early as you need it on your app
  static Future<void> init() async {
    String _envString = await rootBundle.loadString('.env');
    List<String> _lines = _envString.split('\n');
    Map<String, String> _map = {};

    for (var _line in _lines) {
      if (_line.startsWith('#')) continue; // skip comments
      try {
        List<String> _mapItem = _line.split('=');
        _map[_mapItem[0]] = _mapItem[1];
      } catch (e) {
        print(e);
      }
    }
    _envMap = _map;
  }
}
