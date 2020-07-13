import 'package:flutter/material.dart';
import 'package:jin_widget_helper/jin_widget_helper.dart';
import 'package:kh_covid_report/constant/colors.dart';
import 'package:kh_covid_report/constant/style.dart';
import 'package:kh_covid_report/provider/bottom_navigation_provider.dart';
import 'package:provider/provider.dart';

class HomeInfoCard extends StatelessWidget {
  final String title;
  final String number;
  final int animationIndex;
  const HomeInfoCard({Key key, this.title, this.number, this.animationIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: Duration(milliseconds: 800),
      tween: Tween<Offset>(
          begin: Offset(0, 200 * animationIndex.toDouble()), end: Offset.zero),
      builder: (_, value, child) => Transform.translate(
        offset: value,
        child: Card(
          margin: EdgeInsets.only(left: 12, right: 12, bottom: 16),
          child: InkWell(
            onTap: () =>
                Provider.of<BottomNavigationProvider>(context, listen: false)
                    .changeIndex(1),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(title,
                      style: titleStyle.medium.applyColor(secondaryColor)),
                  SpaceY(),
                  Text("$number នាក់", style: headerStyle.bold),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
