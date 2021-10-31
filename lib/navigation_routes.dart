import 'package:flutter/material.dart';
import 'package:flutter_provider_starter/screens/main_screen.dart';

const String mainScreenRoute = '/main_screen';

Map<String, WidgetBuilder> applicationRoutes = <String, WidgetBuilder>{
  mainScreenRoute: (context) => MainScreen()
};