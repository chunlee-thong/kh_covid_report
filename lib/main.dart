import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:jin_widget_helper/jin_widget_helper.dart';
import 'package:kh_covid_report/api_service/covid_case_api.dart';
import 'package:kh_covid_report/constant/supported_locale.dart';

import 'constant/colors.dart';
import 'pages/splash_page/splash_page.dart';

GetIt getIt = GetIt.instance;

void registerLocator() {
  getIt.registerSingleton<CovidCasesApi>(CovidCasesApi());
}

void main() {
  registerLocator();
  return runApp(
    EasyLocalization(
      child: MyApp(),
      supportedLocales: [EN_LOCALE, KH_LOCALE],
      fallbackLocale: EN_LOCALE,
      path: 'resources/language',
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KH Covid Report',
      navigatorKey: JinNavigator.navigatorKey,
      theme: ThemeData(
        primarySwatch: primaryColor,
        accentColor: secondaryColor,
        fontFamily: "GoogleSans",
      ),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: SplashScreenPage(),
    );
  }
}
