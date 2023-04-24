import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:walkmate/config/route/app_routes.dart';
import 'package:walkmate/feature/common_widget/custom_appbar.dart';
import 'package:walkmate/feature/common_widget/custom_button.dart';
import 'package:walkmate/resources/color_manager.dart';

import '../../resources/assets_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/values_manager.dart';
import '../common_widget/custom_text.dart';

class SetLandingPage extends StatefulWidget {
  const SetLandingPage({Key? key}) : super(key: key);

  @override
  State<SetLandingPage> createState() => _SetLandingPageState();
}

class _SetLandingPageState extends State<SetLandingPage> {

  double _value = 0.00;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Positioned(
                  top: 0, right: 0, child: SvgPicture.asset(AssetsManager.pattern)),
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
                      child: CustomAppBar(
                        isTitleColorChange: true,
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
                            textStyle: GoogleFonts.plusJakartaSans(
                              color: Colors.white
                            ),
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
                            textStyle: GoogleFonts.plusJakartaSans(
                                color: Colors.white
                            ),
                            fontSize: FontSize.s12,
                            fontWeight: FontWeightManager.light)),
                  ],
                ),
              ),
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
          SliderTheme(
            data: SliderThemeData(
                thumbColor: ColorManager.primary,
                thumbShape: const RoundSliderThumbShape(
                  enabledThumbRadius: 20.0,
                  disabledThumbRadius: 20.0,
                  elevation: 7,
                  pressedElevation: 9,
                  // child: Icon(Icons.volume_up),
                ),

            ),
            child: Slider.adaptive(
              value: _value,
              activeColor: ColorManager.primary,
              inactiveColor: Colors.grey,
              divisions: 50,
              label: (_value*10000).round().toString(),
              onChanged: (value) {
                setState(() {
                  _value = value;
                });
              },
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(left: AppPadding.p14,right: AppPadding.p12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: '0m'),
                CustomText(text: '10000m'),
              ],
            ),
          ),
          Spacer(),
          CustomButton(
            text: 'Set limit',
            isEnabled: _value <= 0 ? false : true,
            onTap: (){
              context.pushNamed(
                  AppRoutes.checkPoint,
                queryParams: {'target':(_value*10000).round().toString()}
              );
            },
            color: _value <= 0 ? Colors.black12 : ColorManager.primary,
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





//
// class SliderThumbImage extends SliderComponentShape {
//   final ui.Image image;
//
//   SliderThumbImage(this.image);
//
//   @override
//   Size getPreferredSize(bool isEnabled, bool isDiscrete) {
//     return Size(0, 0);
//   }
//
//   @override
//   void paint(PaintingContext context, Offset center,
//       {required Animation<double> activationAnimation,
//         required Animation<double> enableAnimation,
//         required bool isDiscrete,
//         required TextPainter labelPainter,
//         required RenderBox parentBox,
//         required SliderThemeData sliderTheme,
//         required TextDirection textDirection,
//         required double value}) {
//     final canvas = context.canvas;
//     final imageWidth = image?.width ?? 10;
//     final imageHeight = image?.height ?? 10;
//
//     Offset imageOffset = Offset(
//       center.dx - (imageWidth / 2),
//       center.dy - (imageHeight / 2),
//     );
//
//     Paint paint = Paint()..filterQuality = FilterQuality.high;
//
//     if (image != null) {
//       canvas.drawImage(image, imageOffset, paint);
//     }
//   }
// }
//
