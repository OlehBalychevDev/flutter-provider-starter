import 'package:flutter/material.dart';
import 'package:flutter_provider_starter/localization/keys.dart';
import 'package:flutter_translate/flutter_translate.dart';

void showErrorDialog(BuildContext context,
    {required String message, String? title}) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(title ?? translate(Keys.Test_Page_Something_Went_Wrong),
          style: Theme.of(context).textTheme.headline2),
      content: Text(
        message,
        style: Theme.of(context).textTheme.headline1,
      ),
    ),
  );
}
