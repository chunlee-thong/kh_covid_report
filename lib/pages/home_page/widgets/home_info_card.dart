import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jin_widget_helper/jin_widget_helper.dart';
import 'package:kh_covid_report/constant/colors.dart';
import 'package:kh_covid_report/constant/style.dart';
import 'package:kh_covid_report/provider/bottom_navigation_provider.dart';
import 'package:kh_covid_report/widgets/common/custom_splash.dart';
import 'package:provider/provider.dart';

class HomeInfoCard extends StatelessWidget {
  final String title;
  final String number;
  final int animationIndex;
  final bool isDanger;
  const HomeInfoCard({
    Key key,
    this.title,
    this.number,
    this.animationIndex,
    this.isDanger = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: Duration(milliseconds: 800),
      tween: Tween<Offset>(
          begin: Offset(0, 200 * animationIndex.toDouble()), end: Offset.zero),
      builder: (_, value, child) => Transform.translate(
        offset: value,
        child: Card(
          color: isDanger ? Colors.red : null,
          margin: EdgeInsets.only(left: 12, right: 12, bottom: 16),
          child: InkWell(
            splashFactory: InkSplash.splashFactory,
            onTap: () =>
                Provider.of<BottomNavigationProvider>(context, listen: false)
                    .changeIndex(1),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: isDanger
                    ? CrossAxisAlignment.center
                    : CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: titleStyle.medium.applyColor(
                      isDanger ? Colors.white : secondaryColor,
                    ),
                  ).tr(),
                  SpaceY(),
                  Text(
                    "$number",
                    style: headerStyle
                        .applyColor(isDanger ? Colors.white : Colors.black)
                        .bold,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
