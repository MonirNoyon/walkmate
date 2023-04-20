import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../resources/font_manager.dart';
import '../../common_widget/custom_text.dart';


class CustomSlider extends StatefulWidget {
  const CustomSlider({Key? key}) : super(key: key);

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  double value = 75;
  double max = 100;
  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(width: 10.w,),
        SliderTheme(
          data: SliderThemeData(
            trackHeight: 55,
            thumbShape: SliderComponentShape.noOverlay,
            overlayShape: SliderComponentShape.noOverlay,
            valueIndicatorShape: SliderComponentShape
                .noOverlay,
            inactiveTrackColor: Colors.transparent,
            activeTrackColor: Colors.white,
            trackShape: const RectangularSliderTrackShape(),

          ),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.transparent,
                // shape: BoxShape.circle,
                // borderRadius: BorderRadius.circular(12),
                border: Border.all(
                    color: Colors.white
                )
            ),
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
                          max: max,
                          divisions: 30,
                          label: value.round().toString(),
                          onChanged: (value) =>
                              setState(
                                      () =>
                                  this.value = value),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 10.w,),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                    text: "Completed",
                    textColor: Colors.white
                ),
                CustomText(
                    text: "4500m",
                    textColor: Colors.white,
                    fontSize: FontSize.s20,
                    fontWeight: FontWeightManager.medium
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                    text: "Target",
                    textColor: Colors.white
                ),
                CustomText(
                    text: "9000m",
                    textColor: Colors.white54,
                    fontSize: FontSize.s20,
                    fontWeight: FontWeightManager.medium
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
