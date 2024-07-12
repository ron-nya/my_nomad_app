import 'package:go_router/go_router.dart';
import 'package:my_app/features/home/home_screen.dart';
import 'package:my_app/features/join/join_screen.dart';
import 'package:my_app/features/login/login_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
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
