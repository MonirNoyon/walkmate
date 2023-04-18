import 'package:flutter/material.dart';
import 'package:walkmate/config/theme/theme_manager.dart';

import 'config/route/app_pages.dart';

void main() {
  runApp(const OnBoarding());
}

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Walk mate',
      theme: getApplicationTheme(),
      routerConfig: AppPages.router,
    );
  }
}

