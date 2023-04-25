import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import 'package:walkmate/config/route/app_routes.dart';
import 'package:walkmate/data/model/checkpoint_model.dart';
import 'package:walkmate/data/repository/data_repository.dart';
import 'package:walkmate/feature/common_widget/custom_appbar.dart';
import 'package:walkmate/feature/landing/widget/custom_slider.dart';

import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/values_manager.dart';
import '../common_widget/custom_button.dart';
import '../common_widget/custom_text.dart';

class CheckPoint extends ConsumerStatefulWidget {
  CheckPoint({Key? key}) : super(key: key);

  @override
  CheckPointState createState() => CheckPointState();
}

class CheckPointState extends ConsumerState<CheckPoint> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async{
      await ref.watch(appDataRepo).updateDistance(context);
    });
    // ref.watch(appDataRepo).updateDistance();
    // Timer.periodic(const Duration(seconds: 5), (timer) => ref.watch(appDataRepo).updateDistance());
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final checkpoint = ref.watch(appDataRepo).checkPointList;
    final complete = ref.watch(appDataRepo).completedDistance;

    return Scaffold(
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                  top: 0,
                  right: 0,
                  child: SvgPicture.asset(AssetsManager.pattern)),
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
                          right: AppPadding.p2.h),
                      child: SizedBox(
                        height: size.height * 0.25,
                        child: CustomSlider(),
                      ),
                    ),
                  ],
                ),
              ),
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
          const Divider(
            endIndent: AppPadding.p12,
            indent: AppPadding.p12,
          ),
          Expanded(
            child: ListView.builder(
                padding: const EdgeInsets.only(
                    left: AppPadding.p12, right: AppPadding.p12),
                itemCount: checkpoint.length,
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
                    title: CustomText(text: 'Checkpoint ${index + 1}'),
                    trailing: CustomText(
                        text: checkpoint[index].distance.round().toString()),
                  );
                }),
          ),
          CustomButton(
            text: 'Add checkpoint',
            onTap: () async {
              if (checkpoint.isNotEmpty) {
                if (checkpoint[checkpoint.length - 1].distance <
                    complete * 10000) {
                  await ref.read(appDataRepo.notifier).addCheckpoint(
                      ModelCheckPoint(
                          distance: complete * 10000,
                          time: double.parse("${DateTime.now().hour}.${DateTime.now().minute}")
                      )
                  );
                }else{
                  final snackBar = SnackBar(
                    content: CustomText(text: "You have already covered this distance."),
                    backgroundColor: (Colors.black),
                    action: SnackBarAction(
                      label: 'dismiss',
                      onPressed: () {
                      },
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              }else{
                await ref.read(appDataRepo.notifier).addCheckpoint(
                    ModelCheckPoint(
                        distance: complete * 10000,
                        time: double.parse("${DateTime.now().hour}.${DateTime.now().minute}")
                    )
                );
              }
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
            onTap: () async {
              context.pushNamed(AppRoutes.congrats,
                  queryParams: {'isComplete': "0"});
            },
            textColor: ColorManager.primary,
            isBorder: true,
            isSelected: true,
            width: size.width * 0.2,
            height: size.height * 0.007,
          ),
          SizedBox(
            height: 1.h,
          ),
        ],
      ),
    );
  }
}

