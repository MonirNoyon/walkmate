import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sizer/sizer.dart';
import 'package:walkmate/data/app_state_management.dart';
import 'package:walkmate/data/repository/data_repository.dart';
import 'package:walkmate/feature/common_widget/custom_appbar.dart';
import 'package:walkmate/feature/common_widget/custom_button.dart';
import 'package:walkmate/resources/assets_manager.dart';
import 'package:walkmate/resources/color_manager.dart';
import 'package:walkmate/resources/font_manager.dart';
import 'package:walkmate/resources/values_manager.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../config/route/app_routes.dart';
import '../../data/services/notification_service.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends ConsumerState<HomePage> {
  final NotificationServices _notificationServices = NotificationServices();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async{
      await checkUserPermission();
      await ref.read(appDataRepo.notifier).getCurrentLocation();
    });
    _notificationServices.initializeNotification();
  }

  checkUserPermission() async{
    var locationPermission = await Permission.location.status;
    var notificationPermission = await Permission.notification.status;
    if(locationPermission.isDenied){
      if(await Permission.location.request().isGranted){
        print('Permission granted');
      }
    }
    if(notificationPermission.isDenied){
      if(await Permission.notification.request().isGranted){
        print('Permission granted');
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    var darkMode = ref.watch(appState);
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
            child:  CustomAppBar(
              isTitleColorChange: false,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: AppPadding.p4.h,
              left: AppPadding.p2.h,
              right: AppPadding.p4.h,
              bottom: AppPadding.p4.h,
            ),
            child: Text(
              "Set your walking goal today!",
              style: GoogleFonts.plusJakartaSans(
                  fontSize: FontSize.s24.sp,
                  fontWeight: FontWeightManager.medium),
            ),
          ),
          Expanded(
              child: Stack(
            children: [
              Image.asset(
                darkMode
                    ? AssetsManager.personDark
                    : AssetsManager.personLight,
                fit: BoxFit.cover,
              ).animate().fade(duration: 1200.ms, delay: 500.ms),
              Align(
                alignment: Alignment.bottomCenter,
                child: CustomButton(
                        text: 'Get started',
                        // onTap: () async{
                        //   await _notificationServices.sendNotifications(
                        //       "Target Completed",
                        //       "You Covered 5000m-WalkMate"
                        //   );
                        // },
                        onTap: ()=> context.goNamed(AppRoutes.setLanding),
                        textColor: Colors.white,
                        width: size.width * 0.16,
                        height: size.height * 0.007,
                        bottom: AppMargin.m4.h,
                        color: ColorManager.primary)
                    .animate()
                    .fade(duration: 900.ms)
                    .scale(delay: 200.ms),
              )
            ],
          ))
        ],
      ),
    );
  }
}
