import 'package:flutter/material.dart';
import 'package:jin_widget_helper/jin_widget_helper.dart';
import 'package:kh_covid_report/constant/app_constant.dart';
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
        title: Text("កំណែប្រែ"),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.info),
            onTap: () => JinNavigator.dialog(AboutAppDialog()),
            title: Text("អំពីយើងខ្ញុំ"),
          )
        ],
      ),
    );
  }
}
