import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zyptopulse/screens/about_screen.dart';
import 'package:zyptopulse/screens/auth/auth_screen.dart';
import 'package:zyptopulse/screens/auth/onboarding_screen.dart';
import 'package:zyptopulse/screens/settings_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/main_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const AuthScreen(initialPage: 0),
      ),
      GoRoute(
        path: '/signup',
        builder: (context, state) => const AuthScreen(initialPage: 1),
      ),
       GoRoute(
        path: '/aboutUs',
        builder: (context, state) => const AboutUsScreen(),
      ),
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: '/settings',
        builder: (context, state) => const SettingsScreen(),
      ),
      GoRoute(
        path: '/main',
        builder: (context, state) => const MainScreen(initialIndex: 1),
      ),
      GoRoute(
        path: '/main/:tab',
        builder: (context, state) {
          final tab = state.pathParameters['tab'] ?? 'market';
          switch (tab) {
            case 'market':
              return const MainScreen(initialIndex: 1);
            case 'favorites':
              return const MainScreen(initialIndex: 3);
            case 'wallet':
              return const MainScreen(initialIndex: 4);
            default:
              return const MainScreen(initialIndex: 1);
          }
        },
      ),
    ],
  );
});
