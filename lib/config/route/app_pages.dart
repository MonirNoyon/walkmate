
import 'package:go_router/go_router.dart';
import 'package:walkmate/feature/home/home_page.dart';

import 'app_routes.dart';

class AppPages {
  static GoRouter router = GoRouter(initialLocation: '/', routes: [
    GoRoute(
        name: '/',
        path: "/",
        builder: ((context, state) => const HomePage())),
    // GoRoute(
    //     name: AppRoutes.home,
    //     path: "/${AppRoutes.home}",
    //     builder: ((context, state) => HomePage())),
  ]);
}
