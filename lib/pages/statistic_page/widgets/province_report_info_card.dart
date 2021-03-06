import 'package:flutter/material.dart';
import 'package:jin_widget_helper/jin_widget_helper.dart';
import 'package:kh_covid_report/constant/colors.dart';
import 'package:kh_covid_report/constant/localize_key.dart';
import 'package:kh_covid_report/constant/style.dart';
import 'package:kh_covid_report/model/report_model.dart';
import 'package:kh_covid_report/pages/province_statistic_detail_page/province_statistic_detail_page.dart';
import 'package:kh_covid_report/widgets/common/case_info_row.dart';

class ProvinceReportInfoCard extends StatelessWidget {
  final Province province;

  const ProvinceReportInfoCard({
    Key key,
    @required this.province,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            cardHeader(),
            SpaceY(),
            CaseInfoRow(LocaleKeys.new_case, "${province.newCase}"),
            CaseInfoRow(LocaleKeys.recovered, "${province.recovered}"),
            CaseInfoRow(LocaleKeys.new_recover, "${province.newRecovered}"),
            CaseInfoRow(LocaleKeys.death, "${province.deaths}"),
            Divider(),
            CaseInfoRow(LocaleKeys.total, "${province.cases}"),
          ],
        ),
      ),
    );
  }

  Widget cardHeader() {
    return SmallIconButton(
      padding: EdgeInsets.symmetric(vertical: 12),
      margin: EdgeInsets.zero,
      onTap: () {
        JinNavigator.push(ProviceStatisticDetailPage(province: province));
      },
      icon: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            province.location,
            style: subheaderStyle.bold,
          ),
          Icon(
            Icons.arrow_forward,
            color: secondaryColor,
          ),
        ],
      ),
    );
  }
}
