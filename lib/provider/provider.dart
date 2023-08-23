import 'package:flutter/foundation.dart';

class TotalScoreProvider with ChangeNotifier {
  final List<int> _scores = [];

  List<int> get scores => _scores;

  void addScore(int score) {
    _scores.add(score);
    notifyListeners();
  }

  double get averageScore {
    if (_scores.isEmpty) return 0;
    int total = _scores.reduce((value, element) => value + element);
    return total / _scores.length;
  }
}
