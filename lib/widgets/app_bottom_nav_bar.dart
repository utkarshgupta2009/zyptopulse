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
          UIConstants.smallContentPadding, // Add padding around the nav bar
      child: Container(
        decoration: BoxDecoration(
          color: theme.cardColor, // Background color of the nav bar
          borderRadius: BorderRadius.circular(16), // Rounded corners
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1), // Shadow color
              blurRadius: 10, // Blur radius for the shadow
              offset: const Offset(0, 4), // Shadow offset
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
                const Color(0xff777777), // Keep text color constant
            unselectedItemColor: const Color(0xff777777),
            backgroundColor: Colors.transparent, // Make background transparent
            enableFeedback: false, // Disable splash effect
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  decoration: BoxDecoration(
                    boxShadow: currentIndex == 0
                        ? [
                            BoxShadow(
                              color: theme.primaryColor.withOpacity(
                                  0.37), // Use primary color with opacity
                              blurRadius: 16, // Blur radius
                              offset: const Offset(0, 5), // Shadow offset
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
                                  0.37), // Use primary color with opacity
                              blurRadius: 16, // Blur radius
                              offset: const Offset(0, 5), // Shadow offset
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
                                  0.37), // Use primary color with opacity
                              blurRadius: 16, // Blur radius
                              offset: const Offset(0, 5), // Shadow offset
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
                                  0.37), // Use primary color with opacity
                              blurRadius: 16, // Blur radius
                              offset: const Offset(0, 5), // Shadow offset
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
                                  0.37), // Use primary color with opacity
                              blurRadius: 16, // Blur radius
                              offset: const Offset(0, 5), // Shadow offset
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
