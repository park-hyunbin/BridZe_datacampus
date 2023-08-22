import 'package:flutter/material.dart';

class AvrScoreProvider extends ChangeNotifier {
  String avrScore = '';

  void updateAvrScore(String score) {
    avrScore = score;
    notifyListeners();
  }
}
