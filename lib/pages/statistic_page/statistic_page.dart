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
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: false,
            backgroundColor: Colors.white,
            floating: true,
            snap: true,
            expandedHeight: 100,
            flexibleSpace: FlexibleSpaceBar(
              background: headerCard(report.provinces.length),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final province = report.provinces[index];
                return ProvinceReportInfoCard(province: province);
              },
              childCount: report.provinces.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget headerCard(int totalProvinces) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16.0),
      child: Text(
        "ជំងឺកូវីដ១៩ បានរីករាយដាលនៅក្នុងប្រទេសកម្ពុជាចំនួន​ $totalProvinces ខេត្ត រាជធានី",
        style: headerStyle.medium,
        textAlign: TextAlign.center,
      ),
    );
  }
}
