
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:walkmate/data/model/checkpoint_model.dart';

import '../../config/route/app_routes.dart';
import '../services/notification_service.dart';

class DataRepository extends ChangeNotifier{

  List<ModelCheckPoint> checkPointList = [];

  double _targetDistance = 0.0;
  double _completedDistance = 0.0;
  Position? _currentPosition;
  StreamSubscription<Position>? positionStream;

  Position get currentLocation => _currentPosition!;
  double get targetDistance => _targetDistance;
  double get completedDistance => _completedDistance;

  final NotificationServices _notificationServices = NotificationServices();

  addCheckpoint(ModelCheckPoint data) {
     checkPointList.add(data);
    notifyListeners();
  }

  target(double distance){
    _targetDistance = distance;
    print(_targetDistance);
    notifyListeners();
  }
  complete(double distance){
    _completedDistance = distance;
    notifyListeners();
  }


  getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    _currentPosition = position;
    notifyListeners();
  }

  updateDistance(BuildContext context) async {
     positionStream = Geolocator.getPositionStream(
        locationSettings: const LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 15,
    )).listen((position) {
      double distanceInMeters = Geolocator.distanceBetween(
          _currentPosition?.latitude ?? 0.00, _currentPosition?.longitude ?? 0.00,
          position.latitude, position.longitude);
      if((_completedDistance+(distanceInMeters/10000))>=targetDistance){
        positionStream?.cancel();
        _notificationServices.sendNotifications(
            "Target Completed",
            "You Covered ${(targetDistance*10000).round()}m-WalkMate");
        if (context.mounted) {
          context.pushNamed(AppRoutes.congrats,
              queryParams: {'isComplete': "1"});
        }
      }else {
        _completedDistance += distanceInMeters / 10000;
        _currentPosition = position;
      }
      notifyListeners();
    });
    notifyListeners();
  }

}

final appDataRepo = ChangeNotifierProvider<DataRepository>((ref) => DataRepository());