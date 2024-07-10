import 'package:go_router/go_router.dart';
import 'package:my_app/features/join/join_screen.dart';
import 'package:my_app/features/login/login_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoginScreen(),
      routes: [
        GoRoute(
          path: 'login',
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: 'join',
          builder: (context, state) => const JoinScreen(),
        ),
      ],
    ),
  ],
);
