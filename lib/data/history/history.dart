import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:walkmate/data/model/checkpoint_model.dart';
import 'package:walkmate/data/repository/data_repository.dart';
import 'package:walkmate/feature/common_widget/custom_text.dart';
import 'package:walkmate/resources/color_manager.dart';
import 'package:walkmate/resources/font_manager.dart';
import 'package:walkmate/resources/values_manager.dart';

import '../../resources/assets_manager.dart';
import '../app_state_management.dart';


class History extends ConsumerWidget {
  History({Key? key}) : super(key: key);

  // List<_SalesData> data = [
  //   _SalesData('12 am', 3500),
  //   _SalesData('6', 2800),
  //   _SalesData('12 pm', 3400),
  //   _SalesData('1 pm', 3400),
  //   _SalesData('6', 3200),
  //   _SalesData('7', 4000),
  //   _SalesData('9', 4000),
  //   _SalesData('3', 4000),
  //   _SalesData('5', 4000),
  //   _SalesData('1', 4000),
  // ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final checkPoint = ref.watch(appDataRepo).checkPointList;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: ()=>context.pop(),
            child: Icon(CupertinoIcons.arrow_left,color: ColorManager.primary,)),
        title: CustomText(
          text: 'History',
          textStyle: GoogleFonts.manrope(
            color: ColorManager.primary,
            fontWeight: FontWeightManager.medium,
            fontSize: FontSize.s18
          ),
        ),
        actions: [
          GestureDetector(
              onTap: ()=> ref.read(appState.notifier).toggle(),
              child: SvgPicture.asset(
                AssetsManager.themeImage,
                color: ColorManager.primary,
              )),
           const SizedBox(width: 15,)
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: AppPadding.p14,top: AppPadding.p14),
            child: CustomText(
              text: 'Last 24 hours',
              fontWeight: FontWeightManager.medium,
              fontSize: FontSize.s16
            ),
          ),
          SizedBox(height: AppMargin.m4.h,),
          Center(
              child: SfCartesianChart(
                  plotAreaBorderColor: Colors.transparent,
                  primaryXAxis: CategoryAxis(
                      borderColor: Colors.transparent,
                  ),
                  primaryYAxis: NumericAxis(minimum: 0, maximum: 5000, interval: 500),
                  // tooltipBehavior: _tooltip,
                  series: <ChartSeries<ModelCheckPoint, String>>[
                    ColumnSeries<ModelCheckPoint, String>(
                        dataSource: checkPoint,
                        xValueMapper: (ModelCheckPoint data, _) => data.time.round().toString(),
                        yValueMapper: (ModelCheckPoint data, _) => data.distance.round(),
                        width: 0.1,
                        borderColor: Colors.blueAccent,
                        trackColor: Colors.red,
                        trackBorderColor: Colors.redAccent,
                        borderRadius: BorderRadius.circular(20),
                        color: ColorManager.primary)
                  ])
          )
        ],
      ),
    );
  }
}

