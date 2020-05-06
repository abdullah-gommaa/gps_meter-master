import 'package:gpsmeter/core/model/pathpoint.dart';

class Trip {
  //total distance is being stored in meters
  int id;
  double totalDistance;
  double price;
  Duration totalTime;
  Duration waitingTime;
  DateTime startTime;
  DateTime endTime;
  List<PathPoint> points;

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "TotalDistance": totalDistance,
      "Price": price,
      "TotalTime": totalTime.toString(),
      "WaitingTime": waitingTime.toString(),
      "StartTime": startTime.toIso8601String(),
      "EndTime": endTime.toIso8601String()
    };
    return map;
  }
  static Trip fromMap(Map map){
    Trip trip = Trip();
    trip.id = map['Id'];
    trip.totalDistance = map['TotalDistance'];
    //trip.price = map['Price'];
    trip.price = map['Price'];
    trip.totalTime = parseDuration(map['TotalTime']);
    trip.waitingTime = parseDuration(map['WaitingTime']);
    trip.startTime = DateTime.parse(map['StartTime']);
    trip.endTime = DateTime.parse(map['EndTime']);
    //Todo: path points
    return trip;
  }
  static Duration parseDuration(String s) {
    int hours = 0;
    int minutes = 0;
    int micros;
    List<String> parts = s.split(':');
    if (parts.length > 2) {
      hours = int.parse(parts[parts.length - 3]);
    }
    if (parts.length > 1) {
      minutes = int.parse(parts[parts.length - 2]);
    }
    micros = (double.parse(parts[parts.length - 1]) * 1000000).round();
    return Duration(hours: hours, minutes: minutes, microseconds: micros);
  }
}
