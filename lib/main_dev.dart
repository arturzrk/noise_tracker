import 'package:flutter/material.dart';
import 'package:noise_recorder/app_config.dart';
import 'package:noise_recorder/main.dart';

void main() {
  var configuredApp = new AppConfig(
      appTitle: 'Noise Recorder dev',
      environment: 'development',
      child: MyApp());

  runApp(configuredApp);
}
