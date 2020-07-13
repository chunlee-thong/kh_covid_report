import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jin_widget_helper/jin_widget_helper.dart';
import 'package:kh_covid_report/model/report_model.dart';
import 'package:provider/provider.dart';

class CaseMapPage extends StatefulWidget {
  @override
  _CaseMapPageState createState() => _CaseMapPageState();
}

class _CaseMapPageState extends State<CaseMapPage>
    with AfterBuildMixin, AutomaticKeepAliveClientMixin {
  CameraPosition get initialLatLng => CameraPosition(
        target: LatLng(12.5657, 104.9910),
        zoom: 6.5,
      );

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  void addMarkerToMap() {
    final report = Provider.of<ReportModel>(context, listen: false);

    for (var province in report.provinces) {
      final markerId = MarkerId(province.location);
      final Marker marker = Marker(
        markerId: MarkerId(province.location),
        position: LatLng(province.lat, province.lng),
        infoWindow: InfoWindow(
          title: province.location,
          snippet: "${province.cases} ករណី",
        ),
      );
      setState(() {
        markers[markerId] = marker;
      });
    }
  }

  @override
  void afterBuild(BuildContext context) {
    addMarkerToMap();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: initialLatLng,
        markers: Set<Marker>.of(markers.values),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
