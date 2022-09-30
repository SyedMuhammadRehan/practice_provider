import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AuthProvider with ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;
  void setloading(bool val) {
    _loading = val;
    notifyListeners();
  }

  void showDefaultSnackbar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
  }

  void login(BuildContext context, String email, pass) async {
    setloading(true);
    try {
      Response response = await post(Uri.parse('https://reqres.in/api/login'),
          body: {"email": email, "password": pass});

      if (response.statusCode == 200) {
        setloading(false);
        showDefaultSnackbar(context, "Login Succesfully");
      } else {
        setloading(false);
        showDefaultSnackbar(context, "Login Failed");
      }
    } catch (e) {
      setloading(false);
      showDefaultSnackbar(context, "Login Succesfully");
      print(e.toString());
    }
  }
}
