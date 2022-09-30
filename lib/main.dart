import 'package:flutter/material.dart';
import 'package:practice_provider/provider/authprovider.dart';
import 'package:practice_provider/provider/count_provider.dart';
import 'package:practice_provider/provider/favitem_provider.dart';
import 'package:practice_provider/provider/slider_provider.dart';
import 'package:practice_provider/provider/theme_mode_provider.dart';
import 'package:practice_provider/screens/login_wihApi.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => CountProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => SliderProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => FavitemProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => ThemeModeProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => AuthProvider(),
          ),
        ],
        child: Builder(
          builder: (BuildContext context) {
            final themeprovider = Provider.of<ThemeModeProvider>(context);
            return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Flutter Demo',
                themeMode: themeprovider.themeMode,
                theme: ThemeData(
                  brightness: Brightness.light,
                  primarySwatch: Colors.red,
                ),
                darkTheme: ThemeData(
                    brightness: Brightness.dark,
                    primarySwatch: Colors.red,
                    primaryColor: Colors.red,
                    iconTheme: const IconThemeData(color: Colors.pink)),
                home: const LoginWithApi());
          },
        ));
  }
}
