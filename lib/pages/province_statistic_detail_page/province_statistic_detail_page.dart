import 'package:flutter/material.dart';
import 'package:jin_widget_helper/jin_widget_helper.dart';
import 'package:kh_covid_report/constant/localize_key.dart';
import 'package:kh_covid_report/constant/style.dart';
import 'package:kh_covid_report/model/report_model.dart';
import 'package:kh_covid_report/widgets/common/case_info_row.dart';

class ProviceStatisticDetailPage extends StatefulWidget {
  final Province province;

  const ProviceStatisticDetailPage({Key key, @required this.province})
      : super(key: key);
  @override
  _ProviceStatisticDetailPageState createState() =>
      _ProviceStatisticDetailPageState();
}

class _ProviceStatisticDetailPageState
    extends State<ProviceStatisticDetailPage> {
  Province get province => widget.province;

  String appBarTitle() {
    if (province.location == "ភ្នំពេញ") {
      return "ករណីនៅ​ រាជធានី${province.location}";
    }
    return "ករណីនៅ ខេត្ត${province.location}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle()),
      ),
      body: ListView.builder(
        itemCount: province.nationalities.length,
        itemBuilder: (BuildContext context, int index) {
          final nationality = province.nationalities[index];
          return Card(
            margin: EdgeInsets.only(bottom: 16),
            child: ListTile(
              title: Text(nationality.nationality, style: subheaderStyle.bold),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SpaceY(),
                  CaseInfoRow(LocaleKeys.recovered, nationality.recovered),
                  CaseInfoRow(LocaleKeys.death, nationality.deaths.toString()),
                  Divider(),
                  CaseInfoRow(LocaleKeys.total, nationality.cases),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
