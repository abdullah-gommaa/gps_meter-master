import 'package:geolocator/geolocator.dart';

class PathPoint {
  double latitude;
  double longitude;
  DateTime time;

  PathPoint(this.latitude, this.longitude, this.time);

  static Future<double> getDistanceBetween(
      PathPoint point1, PathPoint point2) async {
    double distance = await Geolocator().distanceBetween(
        point1.latitude, point1.longitude, point2.latitude, point2.longitude);
    return distance;
  }

  Map<String, dynamic> toMap(int tripId) {
    Map<String, dynamic> map = {
      "TripID": tripId,
      "Latitude": latitude,
      "Longitude": longitude,
      "Time": time.toIso8601String()
    };
    return map;
  }
  static PathPoint fromMap(Map map) {
    PathPoint point = PathPoint(map['Latitude'], map['Longitude'], DateTime.parse(map['Time']));
    return point;
  }
}
