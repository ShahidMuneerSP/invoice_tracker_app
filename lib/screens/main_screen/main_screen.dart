import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../theme/theme.dart';
import 'pages/home_page/home_page.dart';
import 'pages/history_page/history_page.dart';
import 'widgets/widget_appBar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PersistentTabController? _tabViewController;
  int tab = 0;

  final List<Widget> _screens = [
    const HomePage(),
    const HistoryPage(),
  ];

  @override
  void initState() {
    super.initState();

    _tabViewController = PersistentTabController(initialIndex: tab);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            widgetAppBar(),
            Expanded(
              child: PersistentTabView(
                context,
                screens: _screens,
                items: _perSistentNavBarItems(),
                navBarStyle: NavBarStyle.style6,
                controller: _tabViewController,
                navBarHeight: 60.h,
                backgroundColor: Colors.white,
                resizeToAvoidBottomInset: true,
                bottomScreenMargin: 60.h,
                confineInSafeArea: true,
                popAllScreensOnTapOfSelectedTab: true,
                popActionScreens: PopActionScreensType.all,
                screenTransitionAnimation: const ScreenTransitionAnimation(
                  // Screen transition animation on change of selected tab.
                  animateTabTransition: true,
                  curve: Curves.ease,
                  duration: Duration(milliseconds: 200),
                ),
              ),
            ),
            Container(
              color: Colors.white,
              height: 5.h,
            )
          ],
        ),
      ),
    );
  }

  List<PersistentBottomNavBarItem> _perSistentNavBarItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Transform.translate(
          offset: const Offset(0, 10),
          child: SizedBox(
            height: 40.r,
            width: 40.r,
            // padding: EdgeInsets.all(8),
            child: SvgPicture.asset(
              'assets/icons/icon_home.svg',
              color: AppTheme.primaryColor,
            ),
          ),
        ),
        title: ("Home"),
        textStyle: TextStyle(color: AppTheme.primaryColor, fontSize: 11.sp),
        activeColorPrimary: AppTheme.primaryColor,
        activeColorSecondary: AppTheme.primaryColor,
        inactiveColorPrimary: Colors.black54,
        inactiveIcon: Transform.translate(
          offset: const Offset(0, 10),
          child: SizedBox(
            height: 40.r,
            width: 40.r,
            child: SvgPicture.asset(
              'assets/icons/icon_home.svg',
              color: Colors.black54,
            ),
          ),
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Transform.translate(
          offset: const Offset(0, 10),
          child: SizedBox(
            height: 40.r,
            width: 40.r,
            // padding: EdgeInsets.all(8),
            child: SvgPicture.asset(
              'assets/icons/Icon_history.svg',
              color: AppTheme.primaryColor,
            ),
          ),
        ),
        title: ("History"),
        textStyle: TextStyle(color: AppTheme.primaryColor, fontSize: 11.sp),
        activeColorPrimary: AppTheme.primaryColor,
        activeColorSecondary: AppTheme.primaryColor,
        inactiveColorPrimary: Colors.black54,
        inactiveIcon: Transform.translate(
          offset: const Offset(0, 10),
          child: SizedBox(
            height: 40.r,
            width: 40.r,
            child: SvgPicture.asset(
              'assets/icons/Icon_history.svg',
              color: Colors.black54,
            ),
          ),
        ),
      ),
    ];
  }
}
