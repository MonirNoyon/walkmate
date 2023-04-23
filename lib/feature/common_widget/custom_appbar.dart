import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/app_state_management.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import 'custom_text.dart';


class CustomAppBar extends ConsumerWidget {
  CustomAppBar({Key? key,required this.isTitleColorChange}) : super(key: key);

  bool isTitleColorChange = false;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
            text: 'WalkMate',
            textStyle: GoogleFonts.plusJakartaSans(
              color: isTitleColorChange ? Colors.white : ColorManager.primary
            ),
            fontSize: FontSize.s14,
            fontWeight: FontWeightManager.semiBold),
        GestureDetector(
            onTap: ()=> ref.read(appState.notifier).toggle(),
            child: SvgPicture.asset(
                AssetsManager.themeImage,
                color: isTitleColorChange ? Colors.white : ColorManager.primary,
            )),
      ],
    );
  }
}
