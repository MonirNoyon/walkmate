import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../config/route/app_routes.dart';
import '../../../data/repository/data_repository.dart';
import '../../../data/services/notification_service.dart';
import '../../../resources/font_manager.dart';
import '../../common_widget/custom_text.dart';

class CustomSlider extends ConsumerStatefulWidget {
  const CustomSlider({Key? key}) : super(key: key);

  @override
  CustomSliderState createState() => CustomSliderState();
}

class CustomSliderState extends ConsumerState<CustomSlider> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async{
      await ref.read(appDataRepo.notifier).complete(0.00);
    });
  }


  final NotificationServices _notificationServices = NotificationServices();

  @override
  Widget build(BuildContext context) {
    final target = ref.watch(appDataRepo).targetDistance;
    final complete = ref.watch(appDataRepo).completedDistance;
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 10.w,
        ),
        SliderTheme(
          data: SliderThemeData(
            trackHeight: 55,
            thumbShape: SliderComponentShape.noOverlay,
            overlayShape: SliderComponentShape.noOverlay,
            valueIndicatorShape: SliderComponentShape.noOverlay,
            inactiveTrackColor: Colors.transparent,
            activeTrackColor: Colors.white,
            trackShape: const RectangularSliderTrackShape(),
          ),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.transparent,
                // shape: BoxShape.circle,
                // borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.white)),
            child: Column(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      RotatedBox(
                        quarterTurns: 3,
                        child: Slider(
                          value: complete,
                          min: 0,
                          max: target,
                          divisions: 50,
                          onChanged: (val) async {
                            ref.read(appDataRepo.notifier).complete(val);
                            print(val);
                            if (target == val) {
                              await _notificationServices.sendNotifications(
                                  "Target Completed",
                                  "You Covered ${(target*10000).round()}m-WalkMate");
                              if (context.mounted) {
                                context.pushNamed(AppRoutes.congrats,
                                    queryParams: {'isComplete': "1"});
                              }
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                    text: "Completed",
                    textStyle: GoogleFonts.manrope(color: Colors.white)),
                CustomText(
                    text: "${(complete*10000).round()}m",
                    textStyle: GoogleFonts.plusJakartaSans(color: Colors.white),
                    fontSize: FontSize.s20,
                    fontWeight: FontWeightManager.medium),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                    text: "Target",
                    textStyle: GoogleFonts.manrope(color: Colors.white70)),
                CustomText(
                    text: "${(target*10000).round()}m",
                    textStyle:
                    GoogleFonts.plusJakartaSans(color: Colors.white70),
                    fontSize: FontSize.s20,
                    fontWeight: FontWeightManager.medium),
              ],
            ),
          ],
        )
      ],
    );
  }
}


