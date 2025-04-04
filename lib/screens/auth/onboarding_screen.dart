import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../gen/assets.gen.dart';
import '../../utils/ui_constants.dart';

class OnboardingScreen extends ConsumerWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
              child: Assets.images.background.svg(
            fit: BoxFit.cover,
          )),
          Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center:
                    Alignment.topLeft, // Position the gradient at the top-left
                radius: 1, // Adjust the spread of the gradient
                colors: [
                  Theme.of(context)
                      .primaryColor
                      .withAlpha((0.8 * 255).toInt()),
                   Colors.transparent
                ],
              ),
            ),
            padding: UIConstants.contentPadding,
            height: double.maxFinite,
            width: double.maxFinite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 150,
                ),
                Assets.images.onboardingPerson.svg(
                  width: 100,
                  height: 200,
                ),
                const SizedBox(height: 20),
                Text(
                  "Your Acount has been successfully created",
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(UIConstants.cardBorderRadius),
                    ),
                  ),
                  onPressed: () {
                    context.go('/main'); // Navigate to main screen
                  },
                  child: const Text(
                    'Get Started',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
