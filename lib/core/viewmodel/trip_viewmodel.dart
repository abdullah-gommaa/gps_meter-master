import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gpsmeter/core/model/pathpoint.dart';
import 'package:flutter/cupertino.dart';
import 'package:gpsmeter/core/model/trip.dart';
import 'package:geolocator/geolocator.dart';
import 'package:gpsmeter/core/services/main_service.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TripModel extends ChangeNotifier {
  Trip trip = Trip();
  StreamSubscription<Position> positionStream;
  bool isRunning = false;
  bool isLoading = false;
  Map<PolylineId, Polyline> polyLines = <PolylineId, Polyline>{};
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  CameraPosition beforeRunningPosition = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);
  String buttonText = 'Start';
  GoogleMapController mapController;
  List<LatLng> polyLinePoints = List<LatLng>();
  Polyline polyLine;
  Timer timer;

  
  TripModel(){
    polyLine = Polyline(
        color: Colors.blue,
        polylineId: PolylineId('polyline_id_0'),
        visible: true,
        patterns: <PatternItem>[PatternItem.dash(8)],
        consumeTapEvents: false,
        width: 5,
        points: polyLinePoints
    );
  }

  void start() async {
    //Reset and Setup
    isLoading = true;
    polyLinePoints.clear();
    polyLines.clear();
    markers.clear();
    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    Marker startMarker = Marker(
      markerId: MarkerId('1'),
      position: LatLng(position.latitude, position.longitude),
    );
    markers[MarkerId('1')] = startMarker;
    trip = Trip();
    trip.points = List<PathPoint>();
    trip.startTime = DateTime.now();
    trip.points.add(PathPoint(position.latitude, position.longitude, trip.startTime));
    polyLinePoints.add(LatLng(position.latitude, position.longitude));
    polyLines[PolylineId('polyline_id_0')] = polyLine;
    trip.totalDistance = 0;
    trip.totalTime = Duration(minutes: 0);
    trip.waitingTime = Duration(minutes: 0);

    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      trip.totalTime += Duration(seconds: 1);
      notifyListeners();
    });
    isRunning = true;
    isLoading = false;
    notifyListeners();
    //Stream, every time the position is updated, Calculation and Markings are processed
    positionStream = Geolocator()
        .getPositionStream(LocationOptions(
            accuracy: LocationAccuracy.high, distanceFilter: 10))
        .listen((Position position) async {
      PathPoint temp =
          PathPoint(position.latitude, position.longitude, DateTime.now());

      // Calculations
      trip.totalDistance += await PathPoint.getDistanceBetween(trip.points[trip.points.length-1], temp);
      Duration tempDuration = temp.time.difference(trip.points[trip.points.length - 1].time);
      if(tempDuration.inMinutes >= 10){
        trip.waitingTime += (tempDuration - Duration(minutes: 10));
      }
      //total distance is in meters
      //(meters * 0.13 baisa) + (waiting time in seconds * 50/60) + 300 baisa, divided by 1000 to get in OMR
      trip.price = ((trip.totalDistance * 0.13) + (trip.waitingTime.inSeconds * (50/60)) + 300)/1000;

      //Marking the points and moving Camera
      trip.points.add(temp);
      polyLinePoints.add(LatLng(position.latitude, position.longitude));
      polyLines[PolylineId('polyline_id_0')] = polyLine;
      await mapController.moveCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(position.latitude, position.longitude),
            zoom: 17
          )
        )
      );
      notifyListeners();
    });
  }

  void end() async {
    isLoading = true;
    notifyListeners();
    timer.cancel();
    await positionStream.cancel();
    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    trip.endTime = DateTime.now();
    PathPoint temp = PathPoint(position.latitude, position.longitude, trip.endTime);
    trip.totalDistance += await PathPoint.getDistanceBetween(trip.points[trip.points.length-1], temp);
    Duration tempDuration = temp.time.difference(trip.points[trip.points.length - 1].time);
    if(tempDuration.inMinutes >= 10){
      trip.waitingTime += (tempDuration - Duration(minutes: 10));
    }
    //total distance is in meters
    //(meters * 0.13 baisa) + (waiting time in seconds * 50/60) + 300 baisa, divided by 1000 to get in OMR
    trip.price = ((trip.totalDistance * 0.13) + (trip.waitingTime.inSeconds * (50/60)) + 300)/1000;
    Marker endMarker = Marker(
        markerId: MarkerId('2'),
        position: LatLng(trip.points[trip.points.length-1].latitude, trip.points[trip.points.length-1].longitude)
    );
    markers[MarkerId('2')] = endMarker;
    MainService service = MainService();
    await service.addTrip(trip);
    isRunning = false;
    isLoading = false;
    notifyListeners();
  }

  void buttonClick() {
    if (!isLoading) {
      if (isRunning) {
        buttonText = 'Start';
        end();
      } else {
        buttonText = 'Stop';
        start();
      }
    }
  }
  String getTotalDistance() {
    if (trip.totalDistance != null) {
        //divide by 1000 as distance is stored in meters
        return (trip.totalDistance/1000).toStringAsFixed(1);
      }
      return '0.0';
  }
  String getPrice() {
    if (trip.price != null) {
      return trip.price.toStringAsFixed(3);
    }
    return '0.000';
  }
  String getDuration(){
    if(trip.totalTime != null){
      return "${twoDigits(trip.totalTime.inHours)}:${twoDigits(trip.totalTime.inMinutes.remainder(60))}:${twoDigits(trip.totalTime.inSeconds.remainder(60))}";
    }
    return '00:00:00';
  }
  String getWaitingTime(){
    if (trip.waitingTime != null){
      return "${twoDigits(trip.totalTime.inHours)}:${twoDigits(trip.waitingTime.inMinutes.remainder(60))}:${twoDigits(trip.waitingTime.inSeconds.remainder(60))}";
    }
    return '00:00:00';
  }

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  String twoDigits(int n) {
    if (n >= 10) return "$n";
    return "0$n";
  }



  Future<BitmapDescriptor> _getAssetIcon(BuildContext context, String asset) async {
    final Completer<BitmapDescriptor> bitmapIcon =
        Completer<BitmapDescriptor>();
    final ImageConfiguration config = createLocalImageConfiguration(context);

      AssetImage(asset)
        .resolve(config)
        .addListener(ImageStreamListener((ImageInfo image, bool sync) async {
      final ByteData bytes =
          await image.image.toByteData(format: ImageByteFormat.png);
      final BitmapDescriptor bitmap =
          BitmapDescriptor.fromBytes(bytes.buffer.asUint8List());
      bitmapIcon.complete(bitmap);
    }));

    return await bitmapIcon.future;
  }
}
