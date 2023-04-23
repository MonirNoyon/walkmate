import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:walkmate/config/route/app_routes.dart';
import 'package:walkmate/feature/common_widget/custom_appbar.dart';
import 'package:walkmate/feature/common_widget/custom_button.dart';

import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/values_manager.dart';
import '../common_widget/custom_text.dart';


class Congrats extends StatefulWidget {
  const Congrats({Key? key}) : super(key: key);

  @override
  State<Congrats> createState() => _CongratsState();
}

class _CongratsState extends State<Congrats> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: AppPadding.p8.h,
                bottom: AppPadding.p8.h,
                left: AppPadding.p2.h,
                right: AppPadding.p2.h),
            child: CustomAppBar(
              isTitleColorChange: false,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 14),
            child: Image.asset(
                AssetsManager.congrats,
              height: 18.h,
              width: 18.h,
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(
                  top: AppPadding.p18,
                  left: AppPadding.p14,
                  right: AppPadding.p14,
                  bottom: AppPadding.p18,
              ),
            child: CustomText(
                text: 'Congratulations\non Reaching Your\nTarget',
              textStyle: GoogleFonts.plusJakartaSans(
                color: ColorManager.primary
              ),
              fontSize: 22,
              fontWeight: FontWeightManager.medium
                    ),
          ),
          Padding(
              padding: const EdgeInsets.only(
                  top: AppPadding.p4,
                  left: AppPadding.p14,
                  right: AppPadding.p14,
              ),
            child: CustomText(
                text: 'Your determination and effort is\ninspiring. Keep pushing yourself to\nreach new heights',
              fontSize: 12,
              fontWeight: FontWeightManager.light
                    ),
          ),
          const Spacer(),
          Center(
            child: CustomButton(
                text: 'Home',
                onTap: (){
                  context.goNamed(AppRoutes.setLanding);
                },
                width: size.width * 0.2,
                height: size.height * 0.007,
              color: ColorManager.primary
            ),
          ),
          SizedBox(height: 5.h,)
        ],
      ),
    );
  }
}
