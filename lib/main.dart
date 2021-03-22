import 'package:flutter/material.dart';
import 'package:spree/screens/home_page.dart';
import 'package:spree/utils/helpers/env.dart';
import 'package:spree/utils/services/prefrences.dart';
import 'package:easy_localization/easy_localization.dart';

void main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await Env.init(); // loading environmental values
  await Prefs.init(); // init SharedPrefrences
  runApp(EasyLocalization(
    supportedLocales: [Locale('en', 'US'), Locale('ar', 'EG')],
    path: 'assets/translations',
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Flutter Spree App',
      home: MyHomePage(),
    );
  }
}

