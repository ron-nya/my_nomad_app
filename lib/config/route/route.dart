import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_app/features/home/home_screen.dart';
import 'package:my_app/features/main/main_screen.dart';
import 'package:my_app/features/join/join_screen.dart';
import 'package:my_app/features/login/login_screen.dart';
import 'package:my_app/features/join/repos/authentication_repo.dart';
import 'package:my_app/features/post/post_screen.dart';

final routeProvider = Provider(
  (ref) {
    return GoRouter(
      initialLocation: MainScreen.routeUrl,
      redirect: (context, state) {
        final isLoggedIn = ref.read(authRepo).isLoggedIn;
        if (!isLoggedIn) {
          if (state.matchedLocation != JoinScreen.routeUrl &&
              state.matchedLocation != LoginScreen.routeUrl) {
            return LoginScreen.routeUrl;
          }
        }
        return null;
      },
      routes: [
        GoRoute(
          path: MainScreen.routeUrl,
          builder: (context, state) {
            final initialIndex =
                int.tryParse(state.uri.queryParameters['index'] ?? '0') ?? 0;
            return MainScreen(initialIndex: initialIndex);
          },
        ),
        GoRoute(
          path: LoginScreen.routeUrl,
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: JoinScreen.routeUrl,
          builder: (context, state) => const JoinScreen(),
        ),
        GoRoute(
          path: HomeScreen.routeUrl,
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: '/post',
          builder: (context, state) => const PostScreen(),
        ),
      ],
    );
  },
);
