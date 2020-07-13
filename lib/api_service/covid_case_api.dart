import 'package:dio/dio.dart';
import 'package:kh_covid_report/model/report_model.dart';
import 'base_api_provider.dart';

class CovidCasesApi extends BaseApiProvider {
  Future<ReportModel> fetchReportCases() async {
    return onRequest(() async {
      Response response = await dio.get("/");
      if (response.statusCode == 200) {
        return ReportModel.fromJson(response.data);
      } else
        throw response.data['message'];
    });
  }
}
