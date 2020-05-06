import 'package:flutter/material.dart';
import 'package:gpsmeter/core/model/pathpoint.dart';
import 'package:flutter/cupertino.dart';
import 'package:gpsmeter/core/services/main_service.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class HistoryViewModel extends ChangeNotifier {
  bool isLoading = true;
  List<PathPoint> points;
  MainService service = MainService();
  GoogleMapController controller;
  Map<PolylineId, Polyline> polylines = <PolylineId, Polyline>{};
  PolylineId selectedPolyline;

  HistoryViewModel(int tripId) {
    var initFuture = init(tripId);
    initFuture.then((voidValue) {
      notifyListeners();
    });
  }

  Future<void> init(int tripId) async {
    points = await service.getPathPoints(tripId);
    Polyline polyline;
    PolylineId polylineId;
    List<LatLng> polyLinePoint = List<LatLng>();;
    for(int i=0; i<points.length; i++) {
      polyLinePoint.add(LatLng(points[i].latitude, points[i].longitude));
    }
      polylineId  = PolylineId('polyline_id_0');
      polyline = Polyline(
        color: Colors.blue,
        visible: true,
        patterns: <PatternItem>[PatternItem.dash(8)],
        polylineId: polylineId,
        consumeTapEvents: false,
        width: 5,
        points: polyLinePoint,
        //onTap: null
      );
      polylines[polylineId] = polyline;
    isLoading = false;
    notifyListeners();
    }


  LatLng getStartPosition(){
    return LatLng(points[0].latitude, points[0].longitude);
  }
   onMapCreated(GoogleMapController controller) {
    this.controller = controller;
  }
}