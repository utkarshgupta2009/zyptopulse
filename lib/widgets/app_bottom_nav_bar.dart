import 'package:flutter/material.dart';
import 'package:zyptopulse/gen/assets.gen.dart';
import 'package:zyptopulse/utils/ui_constants.dart';

class AppBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const AppBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding:
          UIConstants.smallContentPadding,   
      child: Container(
        decoration: BoxDecoration(
          color: theme.cardColor,   
          borderRadius: BorderRadius.circular(16),   
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),   
              blurRadius: 10,   
              offset: const Offset(0, 4),   
            ),
          ],
        ),
        child: Theme(
           data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
          child: BottomNavigationBar(
            
            selectedFontSize: 12,
            currentIndex: currentIndex,
            onTap: onTap,
            type: BottomNavigationBarType.fixed,
            selectedItemColor:
                const Color(0xff777777),   
            unselectedItemColor: const Color(0xff777777),
            backgroundColor: Colors.transparent,   
            enableFeedback: false,   
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  decoration: BoxDecoration(
                    boxShadow: currentIndex == 0
                        ? [
                            BoxShadow(
                              color: theme.primaryColor.withOpacity(
                                  0.37),   
                              blurRadius: 16,   
                              offset: const Offset(0, 5),   
                            ),
                          ]
                        : [],
                  ),
                  child: Assets.icons.home.svg(
                    color: currentIndex == 0
                        ? theme.primaryColor
                        : const Color(0xff777777),
                  ),
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  decoration: BoxDecoration(
                    boxShadow: currentIndex == 1
                        ? [
                            BoxShadow(
                              color: theme.primaryColor.withOpacity(
                                  0.37),   
                              blurRadius: 16,   
                              offset: const Offset(0, 5),   
                            ),
                          ]
                        : [],
                  ),
                  child: Assets.icons.markets.svg(
                    color: currentIndex == 1
                        ? theme.primaryColor
                        : const Color(0xff777777),
                  ),
                ),
                label: 'Markets',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  decoration: BoxDecoration(
                    boxShadow: currentIndex == 2
                        ? [
                            BoxShadow(
                              color: theme.primaryColor.withOpacity(
                                  0.37),   
                              blurRadius: 16,   
                              offset: const Offset(0, 5),   
                            ),
                          ]
                        : [],
                  ),
                  child: Assets.icons.trades.svg(
                    color: currentIndex == 2
                        ? theme.primaryColor
                        : const Color(0xff777777),
                  ),
                ),
                label: 'Trades',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  decoration: BoxDecoration(
                    boxShadow: currentIndex == 3
                        ? [
                            BoxShadow(
                              color: theme.primaryColor.withOpacity(
                                  0.37),   
                              blurRadius: 16,   
                              offset: const Offset(0, 5),   
                            ),
                          ]
                        : [],
                  ),
                  child: Assets.icons.favorites.svg(
                    color: currentIndex == 3
                        ? theme.primaryColor
                        : const Color(0xff777777),
                  ),
                ),
                label: 'Favourites',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  decoration: BoxDecoration(
                    boxShadow: currentIndex == 4
                        ? [
                            BoxShadow(
                              color: theme.primaryColor.withOpacity(
                                  0.37),   
                              blurRadius: 16,   
                              offset: const Offset(0, 5),   
                            ),
                          ]
                        : [],
                  ),
                  child: Assets.icons.wallets.svg(
                    color: currentIndex == 4
                        ? theme.primaryColor
                        : const Color(0xff777777),
                  ),
                ),
                label: 'Wallets',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
