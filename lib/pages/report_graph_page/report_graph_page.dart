import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:jin_widget_helper/jin_widget_helper.dart';
import 'package:kh_covid_report/constant/style.dart';
import 'package:kh_covid_report/model/report_model.dart';
import 'package:provider/provider.dart';
import 'package:pie_chart/pie_chart.dart' as PC;

class ReportGraphPage extends StatefulWidget {
  @override
  _ReportGraphPageState createState() => _ReportGraphPageState();
}

class _ReportGraphPageState extends State<ReportGraphPage> {
  Map<String, double> dataMap = new Map();
  List<Color> colorList = [];
  double maxValue = 0;

  void initializeData() {
    final report = Provider.of<ReportModel>(context, listen: false);
    List<double> cases =
        report.provinces.map((p) => p.cases.toDouble()).toList();
    maxValue = cases.reduce(max);
    for (var province in report.provinces) {
      dataMap.putIfAbsent(
        "${report.provinces.indexOf(province) + 1}. ${province.location}",
        () => province.cases.toDouble(),
      );
      colorList.add(JinColorUtils.fromRGB(
        Random().nextInt(255),
        Random().nextInt(255),
        Random().nextInt(255),
      ));
    }
  }

  @override
  void initState() {
    initializeData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final report = Provider.of<ReportModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("តារាងស្ថិតិតាមខេត្តក្រុង"),
      ),
      body: SizedBox.expand(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SpaceY(16),
            BarChart(reportChartData(report)),
            buildPieChart(),
          ],
        ),
      ),
    );
  }

  BarChartData reportChartData(ReportModel report) {
    return BarChartData(
      alignment: BarChartAlignment.spaceAround,
      maxY: maxValue + 10,
      barTouchData: BarTouchData(
        enabled: true,
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Colors.transparent,
          tooltipPadding: EdgeInsets.zero,
          tooltipBottomMargin: 8,
          getTooltipItem: (
            BarChartGroupData group,
            int groupIndex,
            BarChartRodData rod,
            int rodIndex,
          ) {
            return BarTooltipItem(
              rod.y.round().toString(),
              TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            );
          },
        ),
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          textStyle: TextStyle(
            color: const Color(0xff7589a2),
            fontWeight: FontWeight.bold,
            fontSize: 8,
          ),
          margin: 20,
        ),
        leftTitles: SideTitles(showTitles: true, interval: 20),
      ),
      borderData: FlBorderData(show: false),
      barGroups: report.provinces.map((province) {
        final index = report.provinces.indexOf(province);
        return BarChartGroupData(
          x: index + 1,
          barRods: [
            BarChartRodData(
              y: province.cases.toDouble(),
              color: colorList[index],
              width: 16,
            ),
          ],
          showingTooltipIndicators: [0],
        );
      }).toList(),
    );
  }

  Widget buildPieChart() {
    return PC.PieChart(
      dataMap: dataMap,
      animationDuration: Duration(milliseconds: 800),
      chartLegendSpacing: 32.0,
      chartRadius: MediaQuery.of(context).size.width,
      showChartValuesInPercentage: true,
      showChartValues: false,
      showChartValuesOutside: true,
      chartValueBackgroundColor: Colors.grey[200],
      showLegends: true,
      legendPosition: PC.LegendPosition.right,
      decimalPlaces: 1,
      colorList: colorList,
      showChartValueLabel: true,
      initialAngle: 0,
      chartValueStyle: TextStyle(color: Colors.black, fontSize: 8),
      chartType: PC.ChartType.disc,
    );
  }
}
