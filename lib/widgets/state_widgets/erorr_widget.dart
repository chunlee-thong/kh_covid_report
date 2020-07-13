import 'package:flutter/material.dart';
import 'package:jin_widget_helper/jin_widget_helper.dart';
import 'package:kh_covid_report/constant/colors.dart';
import 'package:kh_covid_report/constant/style.dart';

class OnErrorWidget extends StatelessWidget {
  final String message;
  final Function onRefresh;

  const OnErrorWidget({Key key, this.message, this.onRefresh})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "មានបញ្ហាក្នុងការទាញយកទិន្នន័យ! សូមព្យាយាមម្ដងទៀត!",
          style: subtitleStyle,
          textAlign: TextAlign.center,
        ),
        if (onRefresh != null)
          ActionButton(
            icon: Icon(Icons.refresh),
            elevation: 1,
            stretch: false,
            color: secondaryColor,
            child: Text("ព្យាយាមម្ដងទៀត"),
            textColor: Colors.white,
            onPressed: onRefresh,
          ),
      ],
    );
  }
}
