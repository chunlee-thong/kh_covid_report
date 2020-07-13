import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jin_widget_helper/jin_widget_helper.dart';
import 'package:kh_covid_report/services/base_extend_stream.dart';
import 'package:kh_covid_report/constant/localize_key.dart';
import 'package:kh_covid_report/model/report_model.dart';
import 'package:kh_covid_report/pages/case_map_page/case_map_page.dart';
import 'package:kh_covid_report/pages/cases_page/cases_page.dart';
import 'package:kh_covid_report/pages/home_page/home_page.dart';
import 'package:kh_covid_report/pages/setting_page/setting_page.dart';
import 'package:kh_covid_report/provider/bottom_navigation_provider.dart';
import 'package:kh_covid_report/widgets/state_widgets/erorr_widget.dart';
import 'package:provider/provider.dart';

class RootPage extends StatefulWidget {
  final int startPageIndex;

  const RootPage({Key key, this.startPageIndex = 0}) : super(key: key);
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  BaseStream<ReportModel> baseStream = BaseStream();

  Future fetchReportCases() async {
    baseStream.operation(() async {
      return await baseStream.casesApi.fetchReportCases();
    }, loadingOnRefesh: true);
  }

  List<Widget> get pages => [
        MyHomePage(onRefresh: () => fetchReportCases()),
        CasesPage(),
        CaseMapPage(),
        SettingPage(),
      ];

  @override
  void initState() {
    fetchReportCases();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.locale;
    return ChangeNotifierProvider(
      create: (_) => BottomNavigationProvider(widget.startPageIndex),
      child: Consumer<BottomNavigationProvider>(
        builder: (context, state, child) => WillPopScope(
          onWillPop: () async {
            if (state.currentIndex != 0) {
              state.changeIndex(0);
              return false;
            }
            return true;
          },
          child: Scaffold(
            body: StreamHandler(
              stream: baseStream.stream,
              error: (error) => OnErrorWidget(
                message: error,
                onRefresh: () => fetchReportCases(),
              ),
              ready: (report) => Provider<ReportModel>(
                create: (_) => report,
                child: PageView.builder(
                  itemCount: pages.length,
                  controller: state.pageController,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return pages[index];
                  },
                ),
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: state.currentIndex,
              type: BottomNavigationBarType.fixed,
              onTap: (index) {
                state.changeIndex(index);
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  title: Text(LocaleKeys.home).tr(),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.assessment),
                  title: Text(LocaleKeys.report).tr(),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.map),
                  title: Text(LocaleKeys.map).tr(),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  title: Text(LocaleKeys.setting).tr(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
