import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import 'package:walkmate/config/route/app_routes.dart';
import 'package:walkmate/feature/landing/widget/custom_slider.dart';

import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/values_manager.dart';
import '../common_widget/custom_button.dart';
import '../common_widget/custom_text.dart';

class Checkpoint extends StatefulWidget {
  Checkpoint({Key? key}) : super(key: key);

  @override
  State<Checkpoint> createState() => _CheckpointState();
}

class _CheckpointState extends State<Checkpoint> {
  double value = 75;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;



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
                          right: AppPadding.p2.h),
                      child: SizedBox(
                        height: size.height * 0.25,
                        child: CustomSlider(),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                  top: 0,
                  right: 0,
                  child: SvgPicture.asset(AssetsManager.pattern)),
            ],
          ),
          SizedBox(
            height: 3.h,
          ),
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                  padding: const EdgeInsets.only(left: AppPadding.p12),
                  child: CustomText(
                      text: 'CHECKPOINT',
                      fontWeight: FontWeightManager.medium,
                      fontSize: FontSize.s12))),
          Expanded(
            child: ListView.builder(
                padding: const EdgeInsets.only(
                    left: AppPadding.p12, right: AppPadding.p12),
                itemCount: 15,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return ListTile(
                    visualDensity: const VisualDensity(
                        horizontal: VisualDensity.minimumDensity,
                        vertical: VisualDensity.minimumDensity),
                    contentPadding: EdgeInsets.zero,
                    minLeadingWidth: 0,
                    leading: Image.asset(
                      AssetsManager.flag,
                      height: 20,
                      width: 20,
                    ),
                    title: CustomText(text: 'Checkpoint $index'),
                    trailing: CustomText(text: '${100 * index}'),
                  );
                }),
          ),
          CustomButton(
            text: 'Add checkpoint',
            onTap: (){
              context.pushNamed(AppRoutes.congrats);
            },
            color: ColorManager.primary,
            width: size.width * 0.2,
            height: size.height * 0.007,
          ),
          SizedBox(
            height: 1.h,
          ),
          CustomButton(
            text: 'Mark as completed',
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





