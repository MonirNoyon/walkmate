import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:walkmate/feature/common_widget/custom_button.dart';
import 'package:walkmate/feature/common_widget/custom_text.dart';
import 'package:walkmate/resources/assets_manager.dart';
import 'package:walkmate/resources/color_manager.dart';
import 'package:walkmate/resources/font_manager.dart';
import 'package:walkmate/resources/values_manager.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: AppPadding.p8.h,
                left: AppPadding.p2.h,
                right: AppPadding.p2.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                    text: 'WalkMate',
                    textColor: ColorManager.primary,
                    fontSize: FontSize.s14,
                    fontWeight: FontWeightManager.semiBold),
                SvgPicture.asset(AssetsManager.themeImage),
              ],
            ),
          ),
          Padding(
              padding: EdgeInsets.only(
                top: AppPadding.p4.h,
                left: AppPadding.p2.h,
                right: AppPadding.p4.h,
                bottom: AppPadding.p4.h,
              ),
              child: CustomText(
                  text: 'Set your walking goal today!',
                  fontSize: FontSize.s24,
                  fontWeight: FontWeightManager.medium)),
          Expanded(
              child: Stack(
            children: [
              Image.asset(
                AssetsManager.personLight,
                fit: BoxFit.cover,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: CustomButton(
                    text: 'Get started',
                    onTap: () {},
                    textColor: Colors.white,
                    width: size.width * 0.16,
                    height: size.height * 0.007,
                    bottom: AppMargin.m4.h,
                    color: ColorManager.primary),
              )
            ],
          ))
        ],
      ),
    );
  }
}
