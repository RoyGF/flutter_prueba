import 'package:go_router/go_router.dart';
import 'package:test_app/presentation/modules/home/home_router.dart';

GoRouter appRoutes = GoRouter(
  routes: [...HomeRouter.routes],
);
