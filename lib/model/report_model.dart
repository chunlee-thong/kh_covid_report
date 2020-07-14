class ReportModel {
  ReportModel({
    this.country,
    this.cases,
    this.deaths,
    this.recovered,
    this.active,
    this.updated,
    this.provinces,
  });

  String country;
  String cases;
  String deaths;
  String recovered;
  String active;
  DateTime updated;
  List<Province> provinces;

  double newCases() {
    List<double> cases =
        this.provinces.map((p) => p.newCase.toDouble()).toList();
    return cases.fold(0, (p, c) => p + c);
  }

  factory ReportModel.fromJson(Map<String, dynamic> json) => ReportModel(
        country: json["country"] == null ? null : json["country"],
        cases: json["cases"] == null ? null : json["cases"],
        deaths: json["deaths"] == null ? null : json["deaths"],
        recovered: json["recovered"] == null ? null : json["recovered"],
        active: json["active"] == null ? null : json["active"],
        updated:
            json["updated"] == null ? null : DateTime.parse(json["updated"]),
        provinces: json["provinces"] == null
            ? null
            : List<Province>.from(
                json["provinces"].map((x) => Province.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "country": country == null ? null : country,
        "cases": cases == null ? null : cases,
        "deaths": deaths == null ? null : deaths,
        "recovered": recovered == null ? null : recovered,
        "active": active == null ? null : active,
        "updated": updated == null ? null : updated.toIso8601String(),
        "provinces": provinces == null
            ? null
            : List<dynamic>.from(provinces.map((x) => x.toJson())),
      };
}

class Province {
  Province({
    this.location,
    this.cases,
    this.deaths,
    this.recovered,
    this.newCase,
    this.newRecovered,
    this.newDeath,
    this.lat,
    this.lng,
    this.nationalities,
  });

  String location;
  int cases;
  int deaths;
  int recovered;
  int newCase;
  int newRecovered;
  int newDeath;
  double lat;
  double lng;
  List<Nationality> nationalities;

  factory Province.fromJson(Map<String, dynamic> json) => Province(
        location: json["location"] == null ? null : json["location"],
        cases: json["cases"] == null ? null : json["cases"],
        deaths: json["deaths"] == null ? null : json["deaths"],
        recovered: json["recovered"] == null ? null : json["recovered"],
        newCase: json["new_case"] == null ? null : json["new_case"],
        newRecovered:
            json["new_recovered"] == null ? null : json["new_recovered"],
        newDeath: json["new_death"] == null ? null : json["new_death"],
        lat: json["lat"] == null ? null : json["lat"].toDouble(),
        lng: json["lng"] == null ? null : json["lng"].toDouble(),
        nationalities: json["nationalities"] == null
            ? null
            : List<Nationality>.from(
                json["nationalities"].map((x) => Nationality.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "location": location == null ? null : location,
        "cases": cases == null ? null : cases,
        "deaths": deaths == null ? null : deaths,
        "recovered": recovered == null ? null : recovered,
        "new_case": newCase == null ? null : newCase,
        "new_recovered": newRecovered == null ? null : newRecovered,
        "new_death": newDeath == null ? null : newDeath,
        "lat": lat == null ? null : lat,
        "lng": lng == null ? null : lng,
        "nationalities": nationalities == null
            ? null
            : List<dynamic>.from(nationalities.map((x) => x.toJson())),
      };
}

class Nationality {
  Nationality({
    this.nationality,
    this.cases,
    this.recovered,
    this.deaths,
  });

  String nationality;
  String cases;
  String recovered;
  int deaths;

  factory Nationality.fromJson(Map<String, dynamic> json) => Nationality(
        nationality: json["nationality"] == null ? null : json["nationality"],
        cases: json["cases"] == null ? null : json["cases"],
        recovered: json["recovered"] == null ? null : json["recovered"],
        deaths: json["deaths"] == null ? null : json["deaths"],
      );

  Map<String, dynamic> toJson() => {
        "nationality": nationality == null ? null : nationality,
        "cases": cases == null ? null : cases,
        "recovered": recovered == null ? null : recovered,
        "deaths": deaths == null ? null : deaths,
      };
}
