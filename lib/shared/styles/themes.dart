import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todoey_app/shared/styles/colors.dart';

// ThemeData lightTheme = ThemeData(
//   primarySwatch: defaultColor as MaterialColor,
//   scaffoldBackgroundColor: Colors.white,
//   appBarTheme:  const AppBarTheme(
//     titleSpacing: 20.0,
//     backwardsCompatibility: false,
//     //دى مسئولة عن الجزء بتاع الساعة و ال battery و الوانهم
//     systemOverlayStyle: SystemUiOverlayStyle(
//       statusBarColor: Colors.blue,
//       statusBarIconBrightness: Brightness.dark,
//     ),
//     backgroundColor: Colors.white,
//     elevation: 0.0,
//     titleTextStyle: TextStyle(
//       fontFamily: 'Jannah',
//       color: Colors.black,
//       fontSize: 20.0,
//       fontWeight: FontWeight.bold,
//       height: 1.0,
//     ),
//     iconTheme: IconThemeData(
//       color: Colors.black,
//     ),
//   ),
//   bottomNavigationBarTheme:  BottomNavigationBarThemeData(
//     type: BottomNavigationBarType.fixed,
//     selectedItemColor: defaultColor as MaterialColor,
//     unselectedItemColor: Colors.grey,
//     elevation: 20.0,
//     backgroundColor: Colors.white,
//   ),
//   textTheme: const TextTheme(
//     bodyText1: TextStyle(
//       fontSize: 18.0,
//       fontWeight: FontWeight.w600,
//       color: Colors.black,
//     ),
//   ),
//   fontFamily: 'Jannah',
// );

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: backgroundColor,
  appBarTheme: AppBarTheme(
    titleSpacing: 20.0,
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: backgroundColor,
      statusBarIconBrightness: Brightness.light,
    ),
    backgroundColor: backgroundColor,
    elevation: 0.0,
    titleTextStyle: const TextStyle(
      fontFamily: 'Jannah',
      color: Colors.white,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      height: 1.0,
    ),
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: defaultColor,
    unselectedItemColor: Colors.grey,
    elevation: 20.0,
    backgroundColor: HexColor('344FA1'),
  ),
  textTheme: const TextTheme(
    bodyText2: TextStyle(
      fontSize: 26.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      primary: Colors.white,
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: defaultColor,
  ),
);
