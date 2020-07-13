import 'package:flutter/material.dart';
import 'package:kh_covid_report/constant/colors.dart';
import 'package:kh_covid_report/constant/style.dart';
import 'package:kh_covid_report/model/report_model.dart';
import 'package:jin_widget_helper/jin_widget_helper.dart';
import 'package:kh_covid_report/pages/province_case_detail_page/province_case_detail_page.dart';
import 'package:kh_covid_report/widgets/common/case_info_row.dart';

class ProvinceCaseInfoCard extends StatelessWidget {
  final Province province;

  const ProvinceCaseInfoCard({
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
            CaseInfoRow("ករណីថ្មី", "${province.newCase}"),
            CaseInfoRow("ជាសះស្បើយ", "${province.recovered}"),
            CaseInfoRow("ជាសះស្បើយថ្មីៗ", "${province.newRecovered}"),
            CaseInfoRow("ស្លាប់", "${province.deaths}"),
            Divider(),
            CaseInfoRow("សរុប", "${province.cases}"),
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
        JinNavigator.push(ProviceCaseDetailPage(province: province));
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
