import 'package:flutter/material.dart';
import 'dart:ui' as ui show FontFeature;

const lightColor = const MaterialColor(
  0xFFC91B3A,
  <int, Color>{
    50: Color(0xFFF9E4E7),
    100: Color(0xFFEFBBC4),
    200: Color(0xFFE48D9D),
    300: Color(0xFFD95F75),
    400: Color(0xFFD13D58),
    500: Color(0xFFC91B3A),
    600: Color(0xFFC91B3A),
    700: Color(0xFFBC142C),
    800: Color(0xFFB51025),
    900: Color(0xFFA90818),
  },
);
const lightAccentColor = const MaterialAccentColor(
  0xFFffa1a8,
  <int, Color>{
    100: Color(0xFFFFD4D7),
    200: Color(0xFFFFA1A8),
    400: Color(0xFFFF6E79),
    700: Color(0xFFFF5561),
  },
);

class Themes{
  static const Color _darkAccentColor = const Color(0xFF64FFDA);
  static final ThemeData animalCrossingTheme = ThemeData(
    //fontFamily: 'Nintender',
    textSelectionHandleColor: Colors.teal[300],
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      elevation: 0.0,
      color: Colors.teal[300],
      textTheme: TextTheme(
        title: TextStyle(color: Colors.white, fontSize: 20),
        subtitle: TextStyle(color: Colors.white, fontSize: 16),
      ),
      iconTheme: IconThemeData(
          color: Colors.white
      ),
    ),
    dividerColor: Colors.teal,
    scaffoldBackgroundColor: Colors.orange[50],
    accentColor: Colors.brown[300],
    accentIconTheme: const IconThemeData(color: Colors.white),
    primaryIconTheme: const IconThemeData(color: Colors.black),
    iconTheme: const IconThemeData(color: Colors.white),
    errorColor: Colors.red,
    canvasColor: Colors.white,
    primarySwatch: Colors.teal,
    primaryColor: Colors.teal,
    primaryColorLight: Colors.teal[300],
    primaryColorDark: Colors.teal[300],
    cursorColor: Colors.black12,
    backgroundColor: Colors.brown[50],
    highlightColor: Colors.teal[300],
    cardTheme: CardTheme(
      color: Colors.orange[50],//Colors.brown[100],
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: Colors.brown[100], width: 1)
      ),
    ),
    primaryTextTheme: TextTheme(
      title: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400,),
      subtitle: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w400),
      body1: TextStyle(color: Colors.white),
      body2: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
      display1: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
      subhead: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
    ),
    textTheme: TextTheme(
      title: TextStyle(color: Colors.black87, fontSize: 18, fontWeight: FontWeight.w400,
          fontFeatures: [ui.FontFeature.tabularFigures()]),
      subtitle: TextStyle(color: Colors.black87, fontSize: 12, fontWeight: FontWeight.w400),
      body1: TextStyle(color: Colors.black87),
      body2: TextStyle(color: Colors.black87, fontSize: 16, fontWeight: FontWeight.w400),
      display1: TextStyle(color: Colors.black87, fontSize: 18, fontWeight: FontWeight.w600),
      subhead: TextStyle(color: Colors.black87, fontSize: 14, fontWeight: FontWeight.w400),
    ),
    dialogTheme: DialogTheme(
      //titleTextStyle: TextStyle(color: Colors.black87, fontSize: 18, fontWeight: FontWeight.w600),
      backgroundColor: Colors.orange[50],
      //shape: _CustomACDialog(),
    ),
    snackBarTheme: SnackBarThemeData(
      behavior: SnackBarBehavior.fixed,
    ),
    buttonTheme: ButtonThemeData(
      textTheme: ButtonTextTheme.normal,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      layoutBehavior: ButtonBarLayoutBehavior.constrained,
      buttonColor: Colors.brown[200],
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      height: 48,
      highlightColor: Colors.brown[300],
    ),
    bottomSheetTheme: BottomSheetThemeData(
      elevation: 0.0,
      backgroundColor: Colors.white,
    ),
    bottomAppBarTheme: BottomAppBarTheme(
      color: Colors.teal[300],
      shape: CircularNotchedRectangle(),
    ),
    toggleableActiveColor: Colors.brown[300],
    indicatorColor: Colors.brown[100],
    buttonColor: Colors.brown[100],
  );

  static final ThemeData _lightTheme = ThemeData(
    textSelectionHandleColor: lightColor[300],
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      elevation: 0.0,
      color: lightColor,
      textTheme: TextTheme(
        title: TextStyle(color: Colors.white, fontSize: 20),
        subtitle: TextStyle(color: Colors.white, fontSize: 16),
      ),
      iconTheme: IconThemeData(
          color: Colors.white
      ),
    ),
    dividerColor: lightColor,
    scaffoldBackgroundColor: Colors.grey[300],
    accentColor: lightAccentColor,
    accentIconTheme: const IconThemeData(color: Colors.white),
    primaryIconTheme: const IconThemeData(color: Colors.black),
    iconTheme: const IconThemeData(color: Colors.black),
    errorColor: lightAccentColor[700],
    canvasColor: Colors.white,
    primarySwatch: lightColor,
    primaryColor: lightColor,
    cursorColor: Colors.black12,
    backgroundColor: lightColor[50],
    cardTheme: CardTheme(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
    textTheme: TextTheme(
      title: TextStyle(color: Colors.black87, fontSize: 18, fontWeight: FontWeight.w400,
          fontFeatures: [ui.FontFeature.tabularFigures()]),
      subtitle: TextStyle(color: Colors.black87, fontSize: 12, fontWeight: FontWeight.w400),
      body1: TextStyle(color: Colors.black87),
      body2: TextStyle(color: Colors.black87, fontSize: 16, fontWeight: FontWeight.w400),
      display1: TextStyle(color: Colors.black87, fontSize: 18, fontWeight: FontWeight.w600),
      subhead: TextStyle(color: Colors.black87, fontSize: 14, fontWeight: FontWeight.w400),
    ),
    dialogTheme: DialogTheme(
      titleTextStyle: TextStyle(color: Colors.black87, fontSize: 18, fontWeight: FontWeight.w600),
      backgroundColor: lightColor[100],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
    snackBarTheme: SnackBarThemeData(
      //backgroundColor: lightColor[100],
      /*
      contentTextStyle: TextStyle(
          color: Colors.black
      ),

      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: lightAccentColor)
      ),
      */
      behavior: SnackBarBehavior.fixed,
    ),
    buttonTheme: ButtonThemeData(
      textTheme: ButtonTextTheme.normal,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      layoutBehavior: ButtonBarLayoutBehavior.constrained,
      buttonColor: lightColor[100],
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      height: 48,
      highlightColor: Colors.white70,
    ),
    bottomSheetTheme: BottomSheetThemeData(
      elevation: 0.0,
      backgroundColor: Colors.white,
      //shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(8))),
    ),
    bottomAppBarTheme: BottomAppBarTheme(
      color: lightColor,
      shape: CircularNotchedRectangle(),
    ),
    toggleableActiveColor: lightAccentColor,
    indicatorColor: lightColor[100],
    buttonColor: lightColor[100],
  );
  static final ThemeData _darkTheme = ThemeData(
    //fontFamily: 'Nintender',
    splashFactory: InkRipple.splashFactory,
    primaryColorDark: Colors.blueGrey[900],
    textSelectionHandleColor: _darkAccentColor,
    appBarTheme: AppBarTheme(
      elevation: 0.0,
      color: Colors.blueGrey[900],
      textTheme: TextTheme(
        title: TextStyle(color: const Color(0xFFB2B2B2), fontSize: 20),
        subtitle: TextStyle(color: const Color(0xFFB2B2B2), fontSize: 16),
      ),
      iconTheme: const IconThemeData(color: Colors.white54),
    ),
    brightness: Brightness.dark,
    unselectedWidgetColor: Colors.white54,
    dividerColor: Colors.blueGrey[700],
    scaffoldBackgroundColor: Colors.blueGrey[800],
    accentColor: _darkAccentColor,
    accentIconTheme: const IconThemeData(color: Colors.black),
    primaryIconTheme: const IconThemeData(color:const Color(0xFFB2B2B2)),
    iconTheme: const IconThemeData(color: const Color(0xFFB2B2B2)),
    errorColor: _darkAccentColor,
    primaryColorLight: Colors.blueGrey[800],
    canvasColor: Colors.blueGrey[900],
    primarySwatch: Colors.blueGrey,
    primaryColor: Colors.blueGrey[900],
    cursorColor: Colors.white10,
    backgroundColor: Colors.blueGrey[800],
    selectedRowColor: Colors.blueGrey[700],
    primaryTextTheme: TextTheme(
      title: TextStyle(color: const Color(0xFFB2B2B2), fontSize: 18, fontWeight: FontWeight.w400),
      subtitle: TextStyle(color: const Color(0xFFB2B2B2), fontSize: 12, fontWeight: FontWeight.w400),
      body1: TextStyle(color: const Color(0xFFB2B2B2)),
      body2: TextStyle(color: const Color(0xFFB2B2B2), fontSize: 16, fontWeight: FontWeight.w400),
      display1: TextStyle(color: const Color(0xFFB2B2B2), fontSize: 18, fontWeight: FontWeight.w600),
      subhead: TextStyle(color: const Color(0xFFB2B2B2), fontSize: 14, fontWeight: FontWeight.w400),
    ),
    cardTheme: CardTheme(
      color: Colors.blueGrey[900],
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 8,
    ),
    textTheme: TextTheme(
    title: TextStyle(color: const Color(0xFFB2B2B2), fontSize: 18, fontWeight: FontWeight.w400),
    subtitle: TextStyle(color: const Color(0xFFB2B2B2), fontSize: 12, fontWeight: FontWeight.w400),
    body1: TextStyle(color: const Color(0xFFB2B2B2)),
    body2: TextStyle(color: const Color(0xFFB2B2B2), fontSize: 16, fontWeight: FontWeight.w400),
    display1: TextStyle(color: const Color(0xFFB2B2B2), fontSize: 18, fontWeight: FontWeight.w600),
    subhead: TextStyle(color: const Color(0xFFB2B2B2), fontSize: 14, fontWeight: FontWeight.w400),
  ),
    dialogTheme: DialogTheme(
      titleTextStyle: TextStyle(color: const Color(0xFFB2B2B2), fontSize: 18, fontWeight: FontWeight.w600),
      backgroundColor: Colors.blueGrey[900],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: Colors.blueGrey[800],
      contentTextStyle: TextStyle(
          color: const Color(0xFFB2B2B2)
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: _darkAccentColor)
      ),
      behavior: SnackBarBehavior.floating,
    ),
    buttonTheme: ButtonThemeData(
        textTheme: ButtonTextTheme.normal,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        layoutBehavior: ButtonBarLayoutBehavior.constrained,
        buttonColor: Colors.grey[900],
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        height: 48
    ),
    bottomSheetTheme: BottomSheetThemeData(
      elevation: 0.0,
      backgroundColor: Colors.blueGrey[900],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(8))),
    ),
    bottomAppBarTheme: BottomAppBarTheme(
      color: Colors.blueGrey[900],
      shape: CircularNotchedRectangle(),
    ),
    toggleableActiveColor: _darkAccentColor,
    indicatorColor: Colors.blueGrey[700],
    buttonColor: Colors.blueGrey[800],
    /*chipTheme: ChipThemeData(
        brightness: Brightness.dark,
        backgroundColor: Colors.blueGrey[800],
        selectedColor: _darkAccentColor,
        secondarySelectedColor: _darkAccentColor,
        disabledColor: Colors.grey,
        labelPadding: const EdgeInsetsDirectional.only(start: 8, end: 8),
        padding: const EdgeInsets.all(4),
        labelStyle: TextStyle(color: const Color(0xFFB2B2B2), fontSize: 16, fontWeight: FontWeight.w300),
        secondaryLabelStyle: TextStyle(color: const Color(0xFFB2B2B2), fontSize: 16, fontWeight: FontWeight.w300),
        shape: StadiumBorder(),
      )*/
  );

  static ThemeData get light => _lightTheme;
  static ThemeData get dark => _darkTheme;
}

class _CustomACDialog extends ContinuousRectangleBorder{

  @override
  Path getOuterPath(Rect rect, { TextDirection textDirection }) {
    Path()..quadraticBezierTo(rect.width - 25, rect.height / 4, rect.width, rect.height / 2)
      ..quadraticBezierTo(rect.width - 10, rect.height * 0.75, rect.width, rect.height)
      ..lineTo(rect.width, 0);
    return Path()..lineTo(0, rect.height)
      ..quadraticBezierTo(rect.width / 4, rect.height + 15, rect.width / 3, rect.height)
      ..quadraticBezierTo(rect.width / 2, rect.height + 30, rect.width * 0.66, rect.height)
      ..quadraticBezierTo(rect.width * 0.75, rect.height + 15, rect.width, rect.height)
      ..lineTo(rect.width, 0);
  }
}