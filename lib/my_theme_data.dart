import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/app_colors.dart';

class MyThemeData{
  ///light mode
  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primaryLightColor,
    appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: AppColors.whiteColor, size: 30),
        backgroundColor: AppColors.primaryLightColor,
        centerTitle: true,
        elevation: 0,
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        )
    )
    ),

    ///text fonts
    textTheme: TextTheme(
      ///title of app
      titleLarge: GoogleFonts.poppins(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: AppColors.whiteColor
      ),
      ///head of bottom sheet
      titleMedium: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColors.blackColor
      ),
      ///hint text in TextFormField
      labelMedium: GoogleFonts.inter(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color: AppColors.hintTextColor
      ),
      ///select date
      labelLarge: GoogleFonts.inter(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color: AppColors.blackColor
      ),
      ///description in task list
      displaySmall: GoogleFonts.roboto(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: AppColors.blackColor
      ),
      ///language and theme
      headlineMedium: GoogleFonts.inter(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: AppColors.blackColor
      ),

      ///text button
      titleSmall: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.blackColor
      ),
      ///text on category item
      bodyMedium: GoogleFonts.exo(
          fontSize: 22,
          fontWeight: FontWeight.w500,
          color: AppColors.whiteColor
      ),
    )
  );

  ///dark mode
  static final ThemeData darkTheme = ThemeData(
      primaryColor: AppColors.primaryLightColor,
      appBarTheme: AppBarTheme(
          backgroundColor: AppColors.primaryLightColor,
          elevation: 0
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: AppColors.primaryLightColor,
          unselectedItemColor: AppColors.grayColor,
          showUnselectedLabels: false,
          //showSelectedLabels: false,
          backgroundColor: Colors.transparent,
          elevation: 0
      ),

      ///text fonts
      textTheme: TextTheme(
        ///title of app
        titleLarge: GoogleFonts.poppins(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: AppColors.whiteColor
        ),
        ///head of bottom sheet
        titleMedium: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.whiteColor
        ),
        ///hint text in TextFormField
        labelMedium: GoogleFonts.inter(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: AppColors.hintTextColor
        ),
        ///select date
        labelLarge: GoogleFonts.inter(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: AppColors.whiteColor
        ),
        ///description in task list
        displaySmall: GoogleFonts.roboto(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: AppColors.whiteColor
        ),
        ///language and theme
        headlineMedium: GoogleFonts.inter(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: AppColors.whiteColor
        ),
        ///text button
         titleSmall: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.whiteColor
        ),
      )
  );

}