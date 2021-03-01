import 'package:flutter/material.dart';
import 'package:spree/utils/helpers/env.dart';
import 'package:spree/utils/services/prefrences.dart';

void main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  await Env.init(); // loading environmental values
  await Prefs.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Spree App',
      home: MyHomePage(title: 'Flutter Spree App'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Api key :  ' + Env.load('API_KEY'),
            ),
          ],
        ),
      ),
    );
  }
}
