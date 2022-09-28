import 'package:flutter/foundation.dart';

class FavitemProvider with ChangeNotifier {
  List<int> selecteditems = [];
  List<int> get getitems => selecteditems;
  void additems(int value) {
    selecteditems.add(value);
    notifyListeners();
  }

  void rmvitems(int value) {
    selecteditems.remove(value);
    notifyListeners();
  }
}
