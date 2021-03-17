import 'package:flutter/material.dart';
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

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool _localeSwitch = context.locale.languageCode == 'en' ? false : true;

    return Scaffold(
      appBar: AppBar(
        title: Text(tr('title')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text( tr('temp.api') + ':  ' + Env.load('API_KEY').toString()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text( tr('temp.current_locale') +' :  ' + context.locale.languageCode),
                Switch.adaptive(
                    value: _localeSwitch,
                    onChanged: (value) {
                      print(value);
                      _localeSwitch = value;
                      print(_localeSwitch);
                      value
                          ? context.setLocale(Locale('ar', 'EG'))
                          : context.setLocale(Locale('en', 'US'));
                    })
              ],
            )
          ],
        ),
      ),
    );
  }
}
