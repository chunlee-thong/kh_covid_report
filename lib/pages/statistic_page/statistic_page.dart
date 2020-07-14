import 'package:flutter/material.dart';
import 'package:kh_covid_report/constant/localize_key.dart';
import 'package:kh_covid_report/constant/style.dart';
import 'package:kh_covid_report/model/report_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:kh_covid_report/pages/report_graph_page/report_graph_page.dart';
import 'package:kh_covid_report/pages/statistic_page/widgets/province_report_info_card.dart';
import 'package:provider/provider.dart';
import 'package:jin_widget_helper/jin_widget_helper.dart';

class StatisticPage extends StatefulWidget {
  @override
  _StatisticPageState createState() => _StatisticPageState();
}

class _StatisticPageState extends State<StatisticPage> {
  @override
  Widget build(BuildContext context) {
    final report = Provider.of<ReportModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.statistic.tr()),
        actions: <Widget>[
          SmallIconButton(
            icon: Icon(Icons.assessment),
            onTap: () => JinNavigator.push(
                Provider.value(value: report, child: ReportGraphPage())),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            headerCard(report.provinces.length),
            Expanded(
              child: ListView.builder(
                itemCount: report.provinces.length,
                itemBuilder: (BuildContext context, int index) {
                  final province = report.provinces[index];
                  return ProvinceReportInfoCard(province: province);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget headerCard(int totalProvinces) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          "ជំងឺកូវីដ១៩ បានរីករាយដាលនៅក្នុងប្រទេសកម្ពុជាចំនួន​ $totalProvinces ខេត្ត រាជធានី",
          style: headerStyle.medium,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
