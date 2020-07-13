import 'package:flutter/material.dart';
import 'package:jin_widget_helper/jin_widget_helper.dart';
import 'package:kh_covid_report/constant/style.dart';
import 'package:kh_covid_report/model/report_model.dart';
import 'package:kh_covid_report/widgets/common/case_info_row.dart';

class ProviceCaseDetailPage extends StatefulWidget {
  final Province province;

  const ProviceCaseDetailPage({Key key, @required this.province})
      : super(key: key);
  @override
  _ProviceCaseDetailPageState createState() => _ProviceCaseDetailPageState();
}

class _ProviceCaseDetailPageState extends State<ProviceCaseDetailPage> {
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
                  CaseInfoRow("ជាសះស្បើយ", nationality.recovered),
                  CaseInfoRow("ស្លាប់", nationality.deaths.toString()),
                  Divider(),
                  CaseInfoRow("សរុប", nationality.cases),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
