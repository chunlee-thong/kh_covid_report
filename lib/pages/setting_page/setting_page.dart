import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jin_widget_helper/jin_widget_helper.dart';
import 'package:kh_covid_report/constant/localize_key.dart';
import 'package:kh_covid_report/constant/supported_locale.dart';
import 'package:kh_covid_report/widgets/dialog/about_app_dialog.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.setting.tr()),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.info),
            onTap: () => JinNavigator.dialog(AboutAppDialog()),
            title: Text(LocaleKeys.about_us).tr(),
          ),
          ListTile(
            leading: Icon(Icons.language),
            onTap: () {
              if (context.locale == EN_LOCALE) {
                context.locale = KH_LOCALE;
              } else {
                context.locale = EN_LOCALE;
              }
            },
            title: Text(LocaleKeys.change_language).tr(),
          ),
        ],
      ),
    );
  }
}
