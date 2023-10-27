import 'package:flutter/material.dart';
import 'package:assignment_3/themes/colorScheme.dart';
import 'package:assignment_3/themes/textTheme.dart';
import 'package:assignment_3/themes/iconTheme.dart';
import 'package:assignment_3/themes/appbarTheme.dart';
import 'package:assignment_3/themes/snackbarTheme.dart';
import 'package:assignment_3/themes/buttonTheme.dart';
import 'package:assignment_3/themes/switchTheme.dart';
import 'package:assignment_3/themes/sliderTheme.dart';
import 'package:assignment_3/themes/dialogTheme.dart';
import 'package:assignment_3/themes/inputdecorationTheme.dart';

// https://api.flutter.dev/flutter/material/material-library.html

// https://docs.flutter.dev/cookbook/design/themes

// https://docs.flutter.dev/ui/design/material

// https://api.flutter.dev/flutter/material/Theme-class.html

// https://api.flutter.dev/flutter/material/ThemeData-class.html

final ThemeData base = ThemeData.light();

ThemeData buildTheme() {
  return base.copyWith(
    useMaterial3: true,
    colorScheme: colorScheme,
    textTheme: buildTextTheme(base.textTheme),
    iconTheme: buildIconTheme(base.iconTheme),
    appBarTheme: buildAppBarTheme(base.appBarTheme),
    textButtonTheme: buildTextButtonThemeData(base.textButtonTheme),
    outlinedButtonTheme: buildOutlinedButtonThemeData(base.outlinedButtonTheme),
    elevatedButtonTheme: buildElevatedButtonThemeData(base.elevatedButtonTheme),
    snackBarTheme: buildSnackBarTheme(base.snackBarTheme),
    switchTheme: buildSwitchTheme(base.switchTheme),
    sliderTheme: buildSliderTheme(base.sliderTheme),
    dialogTheme: buildDialogTheme(base.dialogTheme),
    //inputDecorationTheme applies to TextField Widget.
    inputDecorationTheme: buildInputDecorationTheme(base.inputDecorationTheme),
    textSelectionTheme: textSelectionThemeData(),
  );
}
