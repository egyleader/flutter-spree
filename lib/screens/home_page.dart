import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:spree/utils/helpers/env.dart';

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
            Text(tr('temp.api') + ':  ' + Env.load('API_KEY').toString()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(tr('temp.current_locale') +
                    ' :  ' +
                    context.locale.languageCode),
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
