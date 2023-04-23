import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

Widget CustomText({
  required String text,
  double fontSize = 12,
  FontWeight fontWeight = FontWeight.w400,
  TextStyle? textStyle,
})=>Text(
  text,
  style: GoogleFonts.plusJakartaSans(
    fontSize: fontSize.sp,
    fontWeight: fontWeight
  ).merge(textStyle),
);