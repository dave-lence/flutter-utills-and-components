// ignore_for_file: depend_on_referenced_packages

import 'package:autovogue_main/screens/in_app_screens/Search/search_home.dart';
import 'package:autovogue_main/utils/constant/color_connstant.dart';
import 'package:autovogue_main/utils/constant/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../screens/in_app_screens/home/home_screens.dart';

class BottomNavBar extends StatefulWidget {
  final int index;
  final PersistentTabController? controller;

  const BottomNavBar({super.key, this.index = 0, this.controller});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  bool deliveriesLaoding = false;
  late PersistentTabController _controller;
  int currentIndex = 0;
  NavBarStyle navBarStyle = NavBarStyle.simple;

  @override
  void initState() {
    super.initState();
    setState(() {
      currentIndex = 0;
    });
    currentIndex = widget.index;
    setState(() {
      _controller =
          widget.controller ??
          PersistentTabController(initialIndex: widget.index);
    });

    // _controller = PersistentTabController(initialIndex: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    // Save what you need here using context
    super.didChangeDependencies();
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Image.asset(CImage.homeIcon, width: 24, height: 24),
        inactiveIcon: Image.asset(CImage.homeIconTwo, width: 24, height: 24),
        title: ("Home"),
        textStyle: GoogleFonts.plusJakartaSans(
          fontSize: 10,
          fontWeight: FontWeight.w500,
        ),
        activeColorPrimary: CColors.primary,
        inactiveColorPrimary: Colors.grey.shade400,
        // routeAndNavigatorSettings: RouteAndNavigatorSettings(
        //   routes: {
        //     '/driver_verification': (context) =>
        //         const DriverVerificationScreen(),
        //     '/nin_verification': (context) => const NINIdentificationScreen(),
        //     '/gurantee_verification': (context) => const GuaranteeScreen(),
        //   },
        // ),
      ),
      PersistentBottomNavBarItem(
        icon: Image.asset(CImage.searchIconTwo, width: 24, height: 24),
        inactiveIcon: Image.asset(CImage.searchIcon, width: 24, height: 24),
        title: ("Search"),
        textStyle: GoogleFonts.plusJakartaSans(
          fontSize: 10,
          fontWeight: FontWeight.w500,
        ),
        activeColorPrimary: CColors.primary,
        inactiveColorPrimary: Colors.grey.shade400,
      ),
      PersistentBottomNavBarItem(
        icon: Image.asset(CImage.canlenderBlack, width: 24, height: 24),
        inactiveIcon: Image.asset(CImage.canlenderGray, width: 24, height: 24),
        title: ("Bookings"),
        textStyle: GoogleFonts.plusJakartaSans(
          fontSize: 10,
          fontWeight: FontWeight.w500,
        ),
        activeColorPrimary: CColors.primary,
        inactiveColorPrimary: Colors.grey.shade400,
        // routeAndNavigatorSettings: RouteAndNavigatorSettings(
        //   routes: {
        //     'set_up_wallet_screen': (context) => const WalletSettingScreen(),
        //     'change_wallet_screen': (context) => const CreateWalletPinScreen(),
        //   },
        // ),
      ),
      PersistentBottomNavBarItem(
        // icon: Image.asset('assets/profile.png', width: 24, height: 24),
        icon: Icon(Icons.person, color: CColors.black),
        // inactiveIcon: Image.asset(
        //   'assets/profile-2.png',
        //   width: 24,
        //   height: 24,
        // ),
        inactiveIcon: Icon(Icons.person, color: CColors.gray),
        title: ("Profile"),
        textStyle: GoogleFonts.plusJakartaSans(
          fontSize: 10,
          fontWeight: FontWeight.w500,
        ),
        activeColorPrimary: CColors.primary,
        inactiveColorPrimary: Colors.grey.shade400,
        // routeAndNavigatorSettings: RouteAndNavigatorSettings(
        //   routes: {
        //     'edit_profile_screen': (context) => const EditProfileScreen(),
        //     'edit_nin_screen': (context) => const EditNinScreen(),
        //     'edit_guarrantee_screen': (context) => const EditGuaranteeScreen(),
        //     'notification_screen': (context) => const NotificationScreen(),
        //   },
        // ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      HomeScreen(),
      const SearchHome(),
      const Center(child: Text('3')),
      const Center(child: Text('4')),
    ];

    return PopScope(
      canPop: false,
      child: Scaffold(
        body: screens[currentIndex],
        bottomNavigationBar: PersistentTabView(
          decoration: NavBarDecoration(
            border: BoxBorder.symmetric(
              horizontal: BorderSide(color: CColors.lightGray),
            ),
          ),

          context,
          controller: _controller,

          screens: screens,
          items: _navBarsItems(),
          stateManagement: true,
          handleAndroidBackButtonPress: true,
          resizeToAvoidBottomInset: true,
          hideNavigationBarWhenKeyboardAppears: true,
          popBehaviorOnSelectedNavBarItemPress: PopBehavior.once,
          onWillPop: (p0) {
            return Future.value(false);
          },
          onItemSelected: (index) {
            setState(() {
              currentIndex = index;
            });
          },

          padding: const EdgeInsets.symmetric(vertical: 7),
          bottomScreenMargin: 5,
          backgroundColor: Colors.white,
          isVisible: true,
          animationSettings: const NavBarAnimationSettings(
            navBarItemAnimation: ItemAnimationSettings(
              duration: Duration(milliseconds: 400),
              curve: Curves.bounceOut,
            ),
            screenTransitionAnimation: ScreenTransitionAnimationSettings(
              animateTabTransition: true,
              duration: Duration(milliseconds: 200),
              screenTransitionAnimationType:
                  ScreenTransitionAnimationType.slide,
            ),
          ),
          navBarHeight: 64,
          navBarStyle: navBarStyle,
        ),
      ),
    );
  }
}
