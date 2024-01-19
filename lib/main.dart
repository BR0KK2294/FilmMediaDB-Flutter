import 'package:filmmediadb/src/app.dart';
import 'package:flutter/material.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';

Future<void> main() async {
  final settingsController = SettingsController(SettingsService());

  await settingsController.loadSettings();
  
  runApp(FilmMediaDB(settingsController: settingsController));
}

