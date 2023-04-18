import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:walkmate/feature/common_widget/custom_button.dart';
import 'package:walkmate/resources/color_manager.dart';

import '../../resources/assets_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/values_manager.dart';
import '../common_widget/custom_text.dart';

class SetLandingPage extends StatelessWidget {
  const SetLandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: size.height / 2,
                decoration: BoxDecoration(
                    color: ColorManager.primary,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25))),
                child: Column(
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
                              textColor: Colors.white,
                              fontSize: FontSize.s14,
                              fontWeight: FontWeightManager.semiBold),
                          SvgPicture.asset(
                            AssetsManager.themeImage,
                            color: Colors.white,
                          ),
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
                            textColor: Colors.white,
                            fontSize: FontSize.s24,
                            fontWeight: FontWeightManager.medium)),
                    Padding(
                        padding: EdgeInsets.only(
                          left: AppPadding.p2.h,
                          right: AppPadding.p4.h,
                        ),
                        child: CustomText(
                            text:
                                'Your determination and effort is inspiring. Keep pushing yourself to reach new heights.',
                            textColor: Colors.white,
                            fontSize: FontSize.s12,
                            fontWeight: FontWeightManager.light)),
                  ],
                ),
              ),
              Positioned(
                  top: 0, right: 0, child: Image.asset(AssetsManager.pattern)),
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            "Add your target",
            style: GoogleFonts.manrope(
                fontWeight: FontWeightManager.medium, fontSize: FontSize.s20),
          ),
          Slider.adaptive(
            min: 0.0,
            max: 100.0,
            value: 0.5,
            divisions: 5,
            label: '12',
            onChanged: (value) {},
          ),
          Spacer(),
          CustomButton(
            text: 'Set limit',
            color: ColorManager.primary,
            width: size.width * 0.2,
            height: size.height * 0.007,
          ),
          SizedBox(
            height: 1.h,
          ),
          CustomButton(
            text: 'History',
            onTap: () {},
            textColor: ColorManager.primary,
            isBorder: true,
            isSelected: true,
            width: size.width * 0.2,
            height: size.height * 0.007,
          ),
          SizedBox(
            height: 3.h,
          ),
        ],
      ),
    );
  }
}
