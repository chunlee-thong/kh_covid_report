import 'package:flutter/material.dart';
import 'package:jin_widget_helper/jin_widget_helper.dart';
import 'package:kh_covid_report/constant/resource_path.dart';
import 'package:kh_covid_report/constant/style.dart';
import 'package:kh_covid_report/pages/root_page/root_page.dart';
import 'package:kh_covid_report/widgets/common/loading_widget.dart';
import '../../constant/colors.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  void onSplashing() async {
    await Future.delayed(const Duration(seconds: 2));
    PageNavigator.pushReplacement(context, RootPage());
  }

  @override
  void initState() {
    onSplashing();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(R.images.medical_care),
            Text(
              "ចូលរួមការពារខ្លួនអ្នកពីជំងឺកូវីដ១៩",
              style: headerStyle,
            ),
            SpaceY(24),
            LoadingWidget(),
          ],
        ),
      ),
    );
  }
}
