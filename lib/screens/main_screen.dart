  
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:zyptopulse/screens/wallet_screen.dart';
import '../gen/assets.gen.dart';
import '../widgets/app_bottom_nav_bar.dart';
import 'home_screen.dart';
import 'market_screen.dart';
import 'trades_screen.dart';
import 'favorites_screen.dart';

class MainScreen extends ConsumerStatefulWidget {
  final int initialIndex;

  const MainScreen({super.key, this.initialIndex = 1});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  late int _currentIndex;
  final profileImageUrl =
           "https://s3-alpha-sig.figma.com/img/818d/8d14/a16dfd97975b4d691c72c84d85d01f09?Expires=1744588800&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=kjB9~mr5kN43XMYSib7jD7T6nnfq~fPBeKJ1OM0Y3XyrIsaQKSHJl8eZXZbHoJRGA4HqL4FdAKll6BVZQA7v6DRcLQGfjMePvylsQNcIBNL5vFH9DyPnbKbZUxXUuQ-G8wVorBU0qz56h-7t6hKUQzXxqMMnSP~y6hEZGpgPpdZM9AKJBtwKlQj4E0J5GiHZY3FPzuWlxNF3i2tpkXJJt~ZrENp~hYmRP4mFm35MDI6owqq8DMEuhLiSMF42xhRvBgmdC8pldN26POu4r7dU7DomsCsqBJg5AAcGHYTHaF-Sk8yuAfPVdfKql1wrLz8DdWhhjNClMCkM1ZfmZxSOig__";


  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(
            kToolbarHeight),   
        child: Container(
          decoration: BoxDecoration(
            color:
                Theme.of(context).scaffoldBackgroundColor,   
            boxShadow: [
              BoxShadow(
                color:
                    Colors.black.withOpacity(0.2),   
                blurRadius: 10.0,   
                offset: const Offset(0, 4),   
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(
                left: 16.0, right: 16, top: 40, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    context.push('/settings');
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(profileImageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Row(
                  children: appBarActionList(),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
            
          IndexedStack(
            index: _currentIndex,
            children: const [
              HomeScreen(),
              MarketScreen(),
              TradesScreen(),
              FavoritesScreen(),
              WalletScreen(),
            ],
          ),

            
          Positioned(
            left: 6,
            right: 6,
            bottom: 16,
            child: AppBottomNavBar(
              currentIndex: _currentIndex,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _appBarActionButton(SvgGenImage icon, Function() onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child:
          GestureDetector(onTap: onTap, child: icon.svg(width: 20, height: 20)),
    );
  }

  List<Widget> appBarActionList() {
    return [
      _appBarActionButton(Assets.icons.searchIcon, () {}),
      _appBarActionButton(Assets.icons.scanner, () {}),
      _appBarActionButton(Assets.icons.notificationIcon, () {}),
    ];
  }
}
