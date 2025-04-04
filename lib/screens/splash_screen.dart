import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:zyptopulse/gen/assets.gen.dart';
import '../providers/auth_provider.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkAuth();
    });
  }

  Future<void> _checkAuth() async {
      
    await Future.delayed(const Duration(seconds: 2));

    final isAuthenticated =
        await ref.watch(authProvider.notifier).isAuthenticated();

    if (isAuthenticated) {
      context.go('/main');
    } else {
      context.go('/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Assets.images.splashScreen.svg(
              width: double.maxFinite,
              height: double.maxFinite,
              fit: BoxFit.cover),
          Positioned(
            top: 250,
            left: 0,
            right: 0,
            child: Assets.icons.logoIcon.image(
              width: 100,
              height: 100,
            ),
          ),
        ],
      ),
    );
  }
}
