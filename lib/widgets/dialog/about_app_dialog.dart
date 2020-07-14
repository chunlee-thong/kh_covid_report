import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jin_widget_helper/jin_widget_helper.dart';
import 'package:kh_covid_report/constant/app_constant.dart';
import 'package:kh_covid_report/constant/colors.dart';
import 'package:kh_covid_report/constant/style.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutAppDialog extends StatefulWidget {
  AboutAppDialog({Key key}) : super(key: key);

  @override
  _AboutAppDialogState createState() => _AboutAppDialogState();
}

class _AboutAppDialogState extends State<AboutAppDialog> {
  Future<void> launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("អំពីកម្មវិធី"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Cambodia Covid Report: ${AppConstant.APP_VERSION}",
            style: titleStyle.bold,
          ),
          SpaceY(16),
          Text("កម្មវិធីអភិវឌ្ឍដោយដោយ: ថុង ឈុនលី"),
          buildSocialButton(),
          Text("ទិន្នន័យផ្ដល់ដោយ:"),
          buildClickableLink(),
        ],
      ),
    );
  }

  Widget buildClickableLink() {
    return SmallFlatButton(
      margin: EdgeInsets.only(top: 16),
      padding: EdgeInsets.zero,
      child: Text(
        AppConstant.BASE_URL,
        style: titleStyle.copyWith(
          decoration: TextDecoration.underline,
          color: secondaryColor,
        ),
      ),
      onTap: () => launchURL(AppConstant.BASE_URL),
    );
  }

  Widget buildSocialButton() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SmallIconButton(
            margin: EdgeInsets.zero,
            icon: Row(
              children: <Widget>[
                Icon(FontAwesomeIcons.facebookSquare, color: secondaryColor),
                SpaceX(),
                Text("Chunlee Thong", style: subtitleStyle),
              ],
            ),
            onTap: () => launchURL("https://www.facebook.com/lee.chunfeng.5"),
          ),
          SmallIconButton(
            margin: EdgeInsets.zero,
            icon: Row(
              children: <Widget>[
                Icon(FontAwesomeIcons.github, color: Colors.black),
                SpaceX(),
                Text("chunlee-thong", style: subtitleStyle),
              ],
            ),
            onTap: () => launchURL("https://github.com/chunlee-thong"),
          ),
        ],
      ),
    );
  }
}
