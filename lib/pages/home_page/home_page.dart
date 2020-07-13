//import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jin_widget_helper/jin_widget_helper.dart';
import 'package:kh_covid_report/constant/colors.dart';
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

class _MyHomePageState extends State<MyHomePage>
    with AutomaticKeepAliveClientMixin {
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
            child: Text("ធ្វើបច្ចុប្បន្នភាព"),
            textColor: Colors.white,
            onPressed: widget.onRefresh,
          ),
          HomeInfoCard(
            title: "សំរាកព្យាបាល",
            number: report.active,
            animationIndex: 1,
          ),
          HomeInfoCard(
            title: "ជាសះស្បើយ",
            number: report.recovered,
            animationIndex: 2,
          ),
          HomeInfoCard(
            title: "ករណីស្លាប់",
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
