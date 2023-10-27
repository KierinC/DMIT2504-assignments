// ignore_for_file: file_names, unused_import

import 'package:flutter/material.dart';
import 'package:assignment_3/themes/colorScheme.dart';
import 'package:assignment_3/themes/textTheme.dart';

// https://api.flutter.dev/flutter/material/SnackBarThemeData-class.html

SnackBarThemeData buildSnackBarTheme(SnackBarThemeData original) {
  return original.copyWith(
    backgroundColor: colorScheme.primary,
    contentTextStyle: TextStyle(color: colorScheme.onPrimary)
  );
}