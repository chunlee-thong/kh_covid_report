import 'package:flutter/material.dart';
import 'package:kh_covid_report/constant/colors.dart';
import 'package:kh_covid_report/constant/resource_path.dart';
import 'package:kh_covid_report/constant/style.dart';
import 'package:kh_covid_report/model/report_model.dart';
import 'package:provider/provider.dart';
import 'package:jin_widget_helper/jin_widget_helper.dart';
import 'package:kh_covid_report/utils/datetime_utils.dart';

class HomeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var report = Provider.of<ReportModel>(context);
    return Container(
      height: MediaQuery.of(context).size.height / 3,
      decoration: BoxDecoration(
        image: DecorationImage(
          colorFilter: ColorFilter.mode(primaryColor, BlendMode.colorBurn),
          image: AssetImage(R.images.medical_report),
          fit: BoxFit.cover,
        ),
      ),
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 32),
        child: TweenAnimationBuilder(
          duration: Duration(milliseconds: 600),
          tween: Tween<double>(begin: 0.0, end: 1.0),
          builder: (_, value, __) => Opacity(
            opacity: value,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(report.country, style: titleStyle.bold),
                Text(
                  "ករណីសរុប: ${report.cases}",
                  style: headerStyle.bold,
                ),
                SpaceY(),
                Text(
                  "ធ្វើបច្ចុប្បន្នភាពចុងក្រោយ:",
                  style: normalStyle,
                ),
                Text(
                  report.updated.customFormat("dd MMM yyyy HH:mm"),
                  style: normalStyle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
