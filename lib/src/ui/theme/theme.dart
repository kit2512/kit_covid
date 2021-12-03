import 'dart:ui';

import 'package:flutter/material.dart' hide Gradient;
import 'package:flutter_screenutil/flutter_screenutil.dart';

const kPrimaryColor = Color(0xFF171746);
const kSecondaryColor = Color(0xFFFF7F5C);
const kPrimaryLightColor = Color(0xFF757591);

class CovidAppTheme {
  static TextTheme lightTextTheme = TextTheme(
    headline1: TextStyle(
      fontFamily: "Poppins",
      color: kPrimaryColor,
      fontSize: 93.sp,
      fontWeight: FontWeight.w300,
      letterSpacing: -1.5.sp,
    ),
    headline2: TextStyle(
      fontFamily: "Poppins",
      color: kPrimaryColor,
      fontSize: 58.sp,
      fontWeight: FontWeight.w300,
      letterSpacing: -0.5.sp,
    ),
    headline3: TextStyle(
      fontFamily: "Poppins",
      color: kPrimaryColor,
      fontSize: 46.sp,
      fontWeight: FontWeight.w400,
    ),
    headline4: TextStyle(
      fontFamily: "Poppins",
      color: kPrimaryColor,
      fontSize: 33.sp,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25.sp,
    ),
    headline5: TextStyle(
      fontFamily: "Poppins",
      color: kPrimaryColor,
      fontSize: 23.sp,
      fontWeight: FontWeight.w400,
    ),
    headline6: TextStyle(
      fontFamily: "Poppins",
      color: kPrimaryColor,
      fontSize: 19.sp,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15.sp,
    ),
    subtitle1: TextStyle(
      fontFamily: "Poppins",
      color: kPrimaryColor,
      fontSize: 15.sp,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.15.sp,
    ),
    subtitle2: TextStyle(
      fontFamily: "Poppins",
      color: kPrimaryColor,
      fontSize: 13.sp,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1.sp,
    ),
    bodyText1: TextStyle(
      fontFamily: "Poppins",
      color: kPrimaryColor,
      fontSize: 15.sp,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5.sp,
    ),
    bodyText2: TextStyle(
      fontFamily: "Poppins",
      color: kPrimaryColor,
      fontSize: 13.sp,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25.sp,
    ),
    button: TextStyle(
      fontFamily: "Poppins",
      color: kPrimaryColor,
      fontSize: 13.sp,
      fontWeight: FontWeight.w500,
      letterSpacing: 1.25.sp,
    ),
    caption: TextStyle(
      fontFamily: "Poppins",
      color: kPrimaryColor,
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.4.sp,
    ),
    overline: TextStyle(
      fontFamily: "Poppins",
      color: kPrimaryColor,
      fontSize: 10.sp,
      fontWeight: FontWeight.w400,
      letterSpacing: 1.5.sp,
    ),
  );

  static ThemeData lightTheme() {
    return ThemeData(
        primaryColorBrightness: Brightness.light,
        primaryColorLight: kPrimaryColor,
        primaryTextTheme: lightTextTheme,
        textTheme: lightTextTheme,
        fontFamily: "Poppins",
        primaryColor: kPrimaryLightColor,
        backgroundColor: kPrimaryLightColor,
        appBarTheme: AppBarTheme(
          titleTextStyle:
              lightTextTheme.subtitle1!.copyWith(fontWeight: FontWeight.w500),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(
            size: 20.sp,
            color: kPrimaryColor,
          ),
          actionsIconTheme: IconThemeData(
            color: kPrimaryColor,
            size: 20.sp,
          ),
        ),
        iconTheme: IconThemeData(
          size: 20.sp,
          color: kPrimaryColor,
        ),
        chipTheme: ChipThemeData(
          backgroundColor: Colors.transparent,
          brightness: Brightness.light,
          labelStyle:
              lightTextTheme.subtitle1!.copyWith(color: kSecondaryColor),
          secondarySelectedColor: Colors.transparent,
          padding: EdgeInsets.zero,
          secondaryLabelStyle: lightTextTheme.subtitle1!.copyWith(
            color: kSecondaryColor,
            fontWeight: FontWeight.w600,
          ),
          selectedColor: kSecondaryColor,
          disabledColor: kSecondaryColor.withOpacity(0.2),
          elevation: 0,
          labelPadding: EdgeInsets.zero,
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            textStyle: lightTextTheme.caption!.copyWith(color: kPrimaryColor),
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedIconTheme: IconThemeData(size: 33.sp),
          selectedItemColor: kSecondaryColor,
        ),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: lightTextTheme.bodyText2!.copyWith(
            color: const Color(0xffD1D1DA),
            fontWeight: FontWeight.w300,
          ),
          contentPadding: EdgeInsets.all(14.sp),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.sp),
            borderSide: BorderSide(
              color: kPrimaryColor.withOpacity(0.2),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.sp),
            borderSide: BorderSide(
              color: kPrimaryColor.withOpacity(0.2),
            ),
          ),
        ),
        popupMenuTheme: PopupMenuThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.sp),
          ),
          elevation: 1,
        ),
        snackBarTheme: SnackBarThemeData(
            backgroundColor: kSecondaryColor,
            contentTextStyle: const TextStyle(color: Colors.white)));
  }
}
