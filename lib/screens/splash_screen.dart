import 'package:flutter/material.dart';
import 'package:spree/utils/services/database.dart';
import 'package:spree/utils/helpers/env.dart';
import 'package:spree/utils/services/prefrences.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      await Env.init(); // load environmental values
      await Prefs.init(); // init SharedPrefrences
      await DB.initDb(databaseName: 'data', refreshEvery: 7); // init db

      //TODO 01 : add all app init logic here
     await Future.delayed(Duration(seconds: 3)); // TODO: delete this 👈
      Navigator.of(context).pushReplacementNamed('/home');
    });
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/spree.png'),
            Text('Flutter Spree'),
            CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
