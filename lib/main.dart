import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'di/locator.dart';
import 'presentation/video-app.dart';

void main() async {
  //!Flutter Engine
  WidgetsFlutterBinding.ensureInitialized();

  //!Dependency
  unawaited(initLocator());

  //!Only Potrait Mode
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(const VideoApp());
}
