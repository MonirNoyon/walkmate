import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:walkmate/feature/common_widget/custom_text.dart';

import '../../resources/color_manager.dart';



Widget CustomButton({
  required String text,
  bool isSvgImage = false,
  bool? softWrap,
  TextAlign? textAlign,
  FontWeight fontWeight = FontWeight.w400,
  double fontSize = 10,
  Color? color,
  Color? imgColor,
  Color? buttonColor,
  double height = 5,
  double width = 30,
  Function()? onTap,
  double radius = 25,
  double top = 0,
  double bottom = 0,
  double left = 0,
  double right = 0,
  double svgImgSize = 2.8,

  double topPadding = 0,
  double bottomPadding = 0,
  double leftPadding = 0,
  double rightPadding = 0,
  Color textColor = Colors.white,
  bool isAlert = false,
  bool isBorder = false,
  bool isSelected = false,
}) {
  return Container(
    height: height.h,
    width: width.w,
    margin: EdgeInsets.only(top: top, left: left, bottom: bottom, right: right),
    padding: EdgeInsets.only(top: topPadding, left: leftPadding, bottom: bottomPadding, right: rightPadding),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        border: isBorder ? Border.all(
            width: 0.5,
            color: isSelected ? ColorManager.primary : ColorManager.dark
        ):Border.all(color: Colors.transparent),
        color: color),
    child: Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(radius),
        splashColor: Colors.white12.withOpacity(0.5),
        child: Center(
          child: CustomText(
              text: text,
            textStyle: GoogleFonts.manrope(
              color: isBorder ? ColorManager.primary : Colors.white
            ),
            fontWeight: fontWeight,
            fontSize: fontSize.sp
          ),
        ),
      ),
    ),
  );
}
