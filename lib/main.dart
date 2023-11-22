import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_home/main/app.dart';
import 'package:test_home/main/app_env.dart';

import 'main/observers.dart';

void main() => mainCommon(AppEnvironment.DEV);

Future<void> mainCommon(AppEnvironment environment) async {
  WidgetsFlutterBinding.ensureInitialized();
  EnvInfo.initialize(environment);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.black,
      statusBarBrightness: Brightness.light,
    ),
  );
  runApp(ProviderScope(
    observers: [
      Observers(),
    ],
    child: App(),
  ));
}
