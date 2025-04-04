  
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum AuthTab { signIn, signUp }

class AuthTabSlider extends StatelessWidget {
  final AuthTab currentTab;
  final Function(AuthTab) onTabChange;

  const AuthTabSlider({
    super.key,
    required this.currentTab,
    required this.onTabChange,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Container(
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
            
          Expanded(
            child: GestureDetector(
              onTap: () {
                if (currentTab != AuthTab.signIn) {
                  onTabChange(AuthTab.signIn);
                  context.go('/login');
                }
              },
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                  color: currentTab == AuthTab.signIn
                    ? theme.primaryColor
                    : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    'Sign in',
                    style: TextStyle(
                      color: currentTab == AuthTab.signIn
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
                if (currentTab != AuthTab.signUp) {
                  onTabChange(AuthTab.signUp);
                  context.go('/signup');
                }
              },
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                  color: currentTab == AuthTab.signUp
                    ? theme.primaryColor
                    : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    'Sign up',
                    style: TextStyle(
                      color: currentTab == AuthTab.signUp
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
    );
  }
}