import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../config/route/app_routes.dart';
import '../../../data/services/notification_service.dart';
import '../../../resources/font_manager.dart';
import '../../common_widget/custom_text.dart';

class CustomSlider extends StatefulWidget {
  CustomSlider({Key? key, required this.target}) : super(key: key);

  String target;

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  double value = 0;
  final NotificationServices _notificationServices = NotificationServices();

  @override
  Widget build(BuildContext context) {
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
                          value: value,
                          min: 0,
                          max: double.parse(widget.target),
                          divisions: 50,
                          onChanged: (val) async {
                            setState(() => value = val);
                            if (val.round() ==
                                double.parse(widget.target).round()) {
                              await _notificationServices.sendNotifications(
                                  "Target Completed",
                                  "You Covered ${widget.target}m-WalkMate");
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
                    text: "${value.round()}m",
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
                    text: "${double.parse(widget.target).round()}m",
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
