import 'package:flutter/foundation.dart';

class SliderProvider with ChangeNotifier {
  double value = 1;

  double get sliderval => value;
  void setval(double val) {
    value = val;

    notifyListeners();
  }
}
