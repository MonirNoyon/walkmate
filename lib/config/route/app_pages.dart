import 'package:go_router/go_router.dart';
import 'package:walkmate/feature/congrats/congrates.dart';
import 'package:walkmate/feature/home/home_page.dart';
import 'package:walkmate/feature/landing/checkpoint.dart';
import 'package:walkmate/feature/landing/set_landing.dart';

import 'app_routes.dart';

class AppPages {
  static GoRouter router = GoRouter(initialLocation: '/', routes: [
    GoRoute(
        name: '/', path: "/", builder: ((context, state) => const HomePage())),
    GoRoute(
        name: AppRoutes.setLanding,
        path: "/${AppRoutes.setLanding}",
        builder: ((context, state) =>  SetLandingPage())),
    GoRoute(
        name: AppRoutes.checkPoint,
        path: "/${AppRoutes.checkPoint}",
        builder: ((context, state) => CheckPoint())),
    GoRoute(
        name: AppRoutes.congrats,
        path: "/${AppRoutes.congrats}",
        builder: ((context, state) => Congrats(
              isComplete: state.queryParams['isComplete'].toString(),
            ))),
  ]);
}
