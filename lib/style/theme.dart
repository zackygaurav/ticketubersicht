import 'package:flutter/material.dart';
import 'package:ticketubersicht_task/style/style.dart';

class AppTheme {
  static MaterialColor? primarySwatch(int desiredColor) {
    Map<int, Color> color = {
      50: const Color.fromRGBO(25, 74, 103, .1),
      100: const Color.fromRGBO(25, 74, 103, .2),
      200: const Color.fromRGBO(25, 74, 103, .3),
      300: const Color.fromRGBO(25, 74, 103, .4),
      400: const Color.fromRGBO(25, 74, 103, .5),
      500: const Color.fromRGBO(25, 74, 103, .6),
      600: const Color.fromRGBO(25, 74, 103, .7),
      700: const Color.fromRGBO(25, 74, 103, .8),
      800: const Color.fromRGBO(25, 74, 103, .9),
      900: const Color.fromRGBO(25, 74, 103, 1),
    };

    return MaterialColor(desiredColor, color);
  }
}
