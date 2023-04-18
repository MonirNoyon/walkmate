import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget CustomText({
  required String text,
  double fontSize = 16
})=>Text(
  text,
  style: GoogleFonts.plusJakartaSans(
    color: Colors.black
  ),
);