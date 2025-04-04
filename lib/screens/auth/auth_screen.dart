// lib/screens/auth_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zyptopulse/gen/assets.gen.dart';
import 'package:zyptopulse/screens/auth/login_screen.dart';
import 'package:zyptopulse/screens/auth/signup_screen.dart';
import 'package:zyptopulse/utils/ui_constants.dart';

class AuthScreen extends ConsumerStatefulWidget {
  final int initialPage;

  const AuthScreen({super.key, this.initialPage = 0});

  @override
  ConsumerState<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<AuthScreen> {
  late final PageController _pageController;
  late int _currentPage;

  @override
  void initState() {
    super.initState();
    _currentPage = widget.initialPage;
    _pageController = PageController(initialPage: _currentPage);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            if (Navigator.of(context).canPop()) {
              Navigator.of(context).pop();
            }
          },
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Assets.images.background.svg(
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
                child: Container(
                  decoration: BoxDecoration(
                    color: theme.cardColor,
                    borderRadius:
                        BorderRadius.circular(UIConstants.cardBorderRadius),
                  ),
                  child: Row(
                    children: [
                      // Sign In Tab
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            _pageController.animateToPage(
                              0,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.all(5),
                            height: 35,
                            decoration: BoxDecoration(
                              color: _currentPage == 0
                                  ? theme.scaffoldBackgroundColor
                                  : theme.cardColor, // Ensure visibility
                              borderRadius: BorderRadius.circular(
                                  UIConstants.cardBorderRadius),
                            ),
                            child: Center(
                              child: Text(
                                'Sign in',
                                style: TextStyle(
                                  color: _currentPage == 0
                                      ? Colors.white
                                      : theme.colorScheme.onSurface,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            _pageController.animateToPage(
                              1,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.all(5),
                            height: 35,
                            decoration: BoxDecoration(
                              color: _currentPage == 1
                                  ? theme.scaffoldBackgroundColor
                                  : theme.cardColor, 
                              borderRadius: BorderRadius.circular(
                                  UIConstants.cardBorderRadius),
                            ),
                            child: Center(
                              child: Text(
                                'Sign up',
                                style: TextStyle(
                                  color: _currentPage == 1
                                      ? Colors.white
                                      : theme.colorScheme.onSurface,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: _onPageChanged,
                  children: const [
                    LoginScreen(),
                    SignupScreen(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
