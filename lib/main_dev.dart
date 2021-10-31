import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_provider_starter/app.dart';
import 'package:flutter_provider_starter/app_config.dart';
import 'package:flutter_provider_starter/localization/translate_preferences.dart';
import 'package:flutter_translate/flutter_translate.dart';

import 'utils/logger.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupLogger();

  final configuredApp = AppConfig(
    appName: 'Flutter Provider Starter',
    flavorName: 'dev',
    apiUrl: 'wordsapiv1.p.rapidapi.com',
    child: Application(),
  );

  final delegate = await LocalizationDelegate.create(
      fallbackLocale: 'en',
      preferences: TranslatePreferences(),
      supportedLocales: [
        'en',
        'ua',
        'ru',
      ]);

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);

  runApp(LocalizedApp(delegate, configuredApp));
}
