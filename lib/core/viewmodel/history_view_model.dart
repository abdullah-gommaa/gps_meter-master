import 'package:flutter/material.dart';
import 'package:gpsmeter/core/model/trip.dart';
import 'package:flutter/cupertino.dart';
import 'package:gpsmeter/core/services/main_service.dart';

class HistoryModel extends ChangeNotifier {
  bool isLoading = true;
  List<Trip> trips;
  MainService service = MainService();

  HistoryModel() {
    var initFuture = init();
    initFuture.then((voidValue) {
      notifyListeners();
    });
  }

  Future<void> init() async {
    trips = await service.getAllTrips();
    isLoading = false;
    notifyListeners();
  }

  String startTime(int index){
    DateTime time = trips[index].startTime;
    return time.day.toString()+'/'+time.month.toString()+'/'+time.year.toString() + ' - '+time.hour.toString() +':'+time.minute.toString()+':'+time.second.toString();
  }
}