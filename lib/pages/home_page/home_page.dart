import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jin_widget_helper/jin_widget_helper.dart';
import 'package:kh_covid_report/constant/colors.dart';
import 'package:kh_covid_report/constant/localize_key.dart';
import 'package:kh_covid_report/model/report_model.dart';
import 'package:kh_covid_report/pages/home_page/widgets/home_header.dart';
import 'package:kh_covid_report/pages/home_page/widgets/home_info_card.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  final Function onRefresh;

  const MyHomePage({Key key, this.onRefresh}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //var data = EasyLocalization.of(context);
    super.build(context);
    final report = Provider.of<ReportModel>(context);
    return Scaffold(
      body: ListView(
        children: <Widget>[
          HomeHeader(),
          ActionButton(
            margin: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            color: primaryColor,
            child: Text(LocaleKeys.update.tr()),
            textColor: Colors.white,
            onPressed: widget.onRefresh,
          ),
          HomeInfoCard(
            title: LocaleKeys.active_case,
            number: report.active,
            animationIndex: 1,
          ),
          HomeInfoCard(
            title: LocaleKeys.recovered,
            number: report.recovered,
            animationIndex: 2,
          ),
          HomeInfoCard(
            title: LocaleKeys.death,
            number: report.deaths,
            animationIndex: 3,
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
