import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:wheelsndeels/UI/home/home_screen.dart';
import 'package:wheelsndeels/UI/home/sell_screen.dart';

import 'chat_screen.dart';
import 'my_add_screen.dart';
import 'profile_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  PersistentTabController? _controller =
      PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return [
      HomeScreen(),
      MyAddScreen(),
      SellNowScreen(),
      ChatScreen(),
      ProfileScreen()
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(
          Icons.home_outlined,
        ),
        title: 'Home',
        activeColorPrimary: Colors.grey,
        activeColorSecondary: Colors.red,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.add_task_outlined),
        title: 'My add',
        activeColorPrimary: Colors.grey,
        activeColorSecondary: Colors.red,
      ),
      PersistentBottomNavBarItem(
        contentPadding: 4.0,
        icon: Icon(
          Icons.add,
          color: Colors.white,
        ),
        title: 'Sell Now',
        activeColorPrimary: Colors.red,
        activeColorSecondary: Colors.red,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.message_outlined),
        title: 'Chat',
        activeColorPrimary: Colors.grey,
        activeColorSecondary: Colors.red,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.person_outline),
        title: 'Profile',
        activeColorPrimary: Colors.grey,
        activeColorSecondary: Colors.red,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        navBarHeight: 65.0,
        padding: NavBarPadding.all(3),
        backgroundColor: Colors.white, // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset:
            true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows:
            true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(0.0),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: ItemAnimationProperties(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle:
            NavBarStyle.style15, // Choose the nav bar style with this property.
      ),
    );
  }
}
