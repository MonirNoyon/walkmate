
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:walkmate/data/model/checkpoint_model.dart';

class DataRepository extends ChangeNotifier{

  List<ModelCheckPoint> checkPointList = [];

  addCheckpoint(ModelCheckPoint data) {
     checkPointList.add(data);
    notifyListeners();
  }

}

final appDataRepo = ChangeNotifierProvider<DataRepository>((ref) => DataRepository());