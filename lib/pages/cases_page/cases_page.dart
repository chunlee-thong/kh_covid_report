import 'package:flutter/material.dart';
import 'package:kh_covid_report/constant/style.dart';
import 'package:kh_covid_report/model/report_model.dart';
import 'package:kh_covid_report/pages/cases_page/widgets/province_case_info_card.dart';
import 'package:provider/provider.dart';
import 'package:jin_widget_helper/jin_widget_helper.dart';

class CasesPage extends StatefulWidget {
  @override
  _CasesPageState createState() => _CasesPageState();
}

class _CasesPageState extends State<CasesPage> {
  @override
  Widget build(BuildContext context) {
    final report = Provider.of<ReportModel>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            headerCard(report.provinces.length),
            Expanded(
              child: ListView.builder(
                itemCount: report.provinces.length,
                itemBuilder: (BuildContext context, int index) {
                  final province = report.provinces[index];
                  return ProvinceCaseInfoCard(province: province);
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
