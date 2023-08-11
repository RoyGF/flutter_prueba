

import 'package:go_router/go_router.dart';

import 'pages/home_page.dart';

class HomeRouter {
  static String homePage = '/';

  static final List<GoRoute> routes = [
    GoRoute(
      path: homePage,
      builder: (context, state) => const HomePage(),
    ),
  ];
}