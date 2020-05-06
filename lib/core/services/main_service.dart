import 'package:gpsmeter/core/services/database.dart';
import 'package:gpsmeter/core/model/trip.dart';
import 'package:gpsmeter/core/model/pathpoint.dart';

class MainService {
  final dbHelper = DatabaseHelper.instance;

   Future addTrip(Trip trip) async {
    int tripId = await dbHelper.insertTrip(trip.toMap());
    for (PathPoint point in trip.points){
      await dbHelper.insertPathPoint(point.toMap(tripId));
    }
    
  }
  
  Future<List<Trip>> getAllTrips() async {
     List<Map<String, dynamic>> data = await dbHelper.queryAllTrips();
     List<Trip> trips = List<Trip>();
     for(Map<String, dynamic> map in data){
       trips.add(Trip.fromMap(map));
     }
     return trips;
     
  }
  Future<List<PathPoint>> getPathPoints(int tripId) async {
    List<Map<String, dynamic>> data = await dbHelper.getPathPoints(tripId);
    List<PathPoint> points = List<PathPoint>();
    for (Map<String, dynamic> map in data) {
      points.add(PathPoint.fromMap(map));
    }
    return points;
  }
}