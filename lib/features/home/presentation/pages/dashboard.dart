import 'package:cashier_app/core/assets/assets.gen.dart';
import 'package:cashier_app/core/constants/app_colors.dart';
import 'package:cashier_app/features/home/presentation/pages/category_page.dart';
import 'package:cashier_app/features/home/presentation/pages/home_page.dart';
import 'package:cashier_app/features/more/presentation/pages/more_page.dart';
import 'package:cashier_app/features/order/presentation/pages/mybag_page.dart';

import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex = 0;

  final List<Widget> dashboard_items = [
    HomePage(),
    CategoryPage(),
    MyBagPage(),
    MorePage()
  ];

  void _onItemTapped(index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        clipBehavior: Clip.hardEdge,
        height: 70,
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey,
              blurRadius: 2,
            ),
          ],
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
        ),
        child: NavigationBar(
          backgroundColor: Colors.white,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          indicatorColor: AppColors.primary,
          destinations: [
            NavigationDestination(
              icon: Assets.icons.home.svg(
                  colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn)),
              label: '',
              selectedIcon: Assets.icons.home.svg(
                  colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn)),
            ),
            NavigationDestination(
                icon: Assets.icons.inactive.svg(
                    colorFilter:
                        ColorFilter.mode(Colors.black, BlendMode.srcIn)),
                label: '',
                selectedIcon: Assets.icons.inactive.svg(
                    colorFilter:
                        ColorFilter.mode(Colors.white, BlendMode.srcIn))),
            NavigationDestination(
                icon: Assets.icons.bag.svg(
                    colorFilter:
                        ColorFilter.mode(Colors.black, BlendMode.srcIn)),
                label: '',
                selectedIcon: Assets.icons.bag.svg(
                    colorFilter:
                        ColorFilter.mode(Colors.white, BlendMode.srcIn))),
            NavigationDestination(
                icon: Assets.icons.menu.svg(
                    colorFilter:
                        ColorFilter.mode(Colors.black, BlendMode.srcIn)),
                label: '',
                selectedIcon: Assets.icons.menu.svg(
                    colorFilter:
                        ColorFilter.mode(Colors.white, BlendMode.srcIn))),
          ],
          selectedIndex: _currentIndex,
          onDestinationSelected: _onItemTapped,
        ),
      ),
      body: dashboard_items.elementAt(_currentIndex),
    );
  }
}
