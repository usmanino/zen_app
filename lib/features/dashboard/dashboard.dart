import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zen_app/core/style/colors.dart';
import 'package:zen_app/features/home/home_screen.dart';
import 'package:zen_app/features/profile/profile_screen.dart';
import 'package:zen_app/features/settings/setting_screen.dart';
import 'package:zen_app/features/task/task_screen.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  List pages = const [
    HomeScreen(),
    TaskScreen(),
    ProfileScreen(),
    SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 2,
        selectedItemColor: AppColor().primary,
        unselectedItemColor: const Color(0xffA1824A),
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/dashboard/home.svg',
              color: _currentIndex == 0
                  ? AppColor().primary
                  : const Color(0xffA1824A),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/dashboard/task.svg',
              color: _currentIndex == 1
                  ? AppColor().primary
                  : const Color(0xffA1824A),
            ),
            label: 'Task',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/dashboard/profile.svg',
              color: _currentIndex == 2
                  ? AppColor().primary
                  : const Color(0xffA1824A),
            ),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/dashboard/setting.svg',
              color: _currentIndex == 3
                  ? AppColor().primary
                  : const Color(0xffA1824A),
            ),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
