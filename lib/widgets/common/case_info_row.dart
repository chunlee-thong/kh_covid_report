import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jin_widget_helper/jin_widget_helper.dart';
import 'package:kh_covid_report/constant/localize_key.dart';
import 'package:kh_covid_report/constant/style.dart';

class CaseInfoRow extends StatelessWidget {
  final String title;
  final String amount;

  const CaseInfoRow(this.title, this.amount);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(title).tr(),
          Text("$amount ${LocaleKeys.cases.tr()}", style: subtitleStyle.bold),
        ],
      ),
    );
  }
}
