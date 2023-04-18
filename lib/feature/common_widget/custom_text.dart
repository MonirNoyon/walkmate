import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

Widget CustomText({
  required String text,
  Color textColor = Colors.black,
  double fontSize = 12,
  FontWeight fontWeight = FontWeight.w400
})=>Text(
  text,
  style: GoogleFonts.plusJakartaSans(
    color: textColor,
    fontSize: fontSize.sp,
    fontWeight: fontWeight
  ),
);