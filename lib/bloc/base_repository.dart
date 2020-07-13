import 'package:kh_covid_report/api_service/covid_case_api.dart';
import 'package:kh_covid_report/main.dart';

class BaseRepository {
  CovidCasesApi casesApi = getIt<CovidCasesApi>();
}
