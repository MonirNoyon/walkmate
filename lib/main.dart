import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';
import 'package:walkmate/config/theme/theme_manager.dart';

import 'config/route/app_pages.dart';
import 'data/app_state_management.dart';

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
  runApp( const ProviderScope(child:  OnBoarding()));
}

class OnBoarding extends ConsumerWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    var darkMode = ref.watch(appState);
    return Sizer(
        builder: (context, orientation, deviceType) => MaterialApp.router(
              debugShowCheckedModeBanner: false,
              title: 'Walk mate',
              //for light theme
              theme: getApplicationTheme(),
              // uses for dark theme
              darkTheme: getApplicationDarkTheme(),
              themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
              routerConfig: AppPages.router,
            ));
  }
}
