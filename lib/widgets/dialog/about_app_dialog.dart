import 'package:flutter/material.dart';
import 'package:jin_widget_helper/jin_widget_helper.dart';
import 'package:kh_covid_report/constant/app_constant.dart';

class AboutAppDialog extends StatefulWidget {
  AboutAppDialog({Key key}) : super(key: key);

  @override
  _AboutAppDialogState createState() => _AboutAppDialogState();
}

class _AboutAppDialogState extends State<AboutAppDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("អំពីកម្មវិធី"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("កម្មវិធីដោយ: ថុង ឈុនលី"),
          SpaceY(),
          Text("ទិន្នន័យផ្ដល់ដោយ:"),
          Text("${AppConstant.BASE_URL}"),
        ],
      ),
    );
  }
}
