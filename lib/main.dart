import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'package:walkmate/config/theme/theme_manager.dart';

import 'config/route/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // for always portrait orientation
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
  ));
  runApp(const OnBoarding());
}

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (context, orientation, deviceType) => MaterialApp.router(
              debugShowCheckedModeBanner: false,
              title: 'Walk mate',
              //for light theme
              theme: getApplicationTheme(),
              // uses for dark theme
              darkTheme: getApplicationDarkTheme(),
              themeMode: ThemeMode.light,
              routerConfig: AppPages.router,
            ));
  }
}
