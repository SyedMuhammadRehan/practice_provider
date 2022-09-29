import 'package:flutter/material.dart';
import 'package:practice_provider/provider/theme_mode_provider.dart';
import 'package:provider/provider.dart';

class LightAndDarkTheme extends StatefulWidget {
  const LightAndDarkTheme({super.key});

  @override
  State<LightAndDarkTheme> createState() => _LightAndDarkThemeState();
}

class _LightAndDarkThemeState extends State<LightAndDarkTheme> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeModeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Light & Dark Theme"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          RadioListTile<ThemeMode>(
              title: const Text("Light Mode"),
              value: ThemeMode.light,
              groupValue: themeProvider.themeMode,
              onChanged: themeProvider.setMode),
          RadioListTile(
              title: const Text("Dark Mode"),
              value: ThemeMode.dark,
              groupValue: themeProvider.themeMode,
              onChanged: themeProvider.setMode),
          RadioListTile(
              title: const Text("System Mode"),
              value: ThemeMode.system,
              groupValue: themeProvider.themeMode,
              onChanged: themeProvider.setMode),
          const Center(child: Icon(Icons.favorite))
        ],
      ),
    );
  }
}
