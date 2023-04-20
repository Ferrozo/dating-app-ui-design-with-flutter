import 'package:flutter/material.dart';

import '../../core/app_assets.dart';

class BottomMenu extends StatelessWidget {
  const BottomMenu({super.key});

  @override
  Widget build(BuildContext context) {
    const double iconSize = 25;
    return BottomNavigationBar(
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white.withOpacity(0.5),
      items: [
        BottomNavigationBarItem(
            backgroundColor: Colors.transparent,
            icon: Image.asset(AppAssets.homeIcon, width: iconSize),
            label: ''),
        BottomNavigationBarItem(
            icon: Image.asset(AppAssets.exploreIcon, width: iconSize),
            label: ''),
        BottomNavigationBarItem(
            icon: Image.asset(AppAssets.saveIcon, width: iconSize), label: ''),
        BottomNavigationBarItem(
            icon: Image.asset(AppAssets.messageIcon, width: iconSize),
            label: ''),
      ],
    );
  }
}
