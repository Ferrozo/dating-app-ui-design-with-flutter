import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

class BottomMenu extends StatelessWidget {
  const BottomMenu({super.key});

  @override
  Widget build(BuildContext context) {
    const double iconSize = 30;
    return BottomNavigationBar(
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white.withOpacity(0.5),
      items: const [
        BottomNavigationBarItem(
            backgroundColor: Colors.transparent,
            icon: Icon(
              UniconsLine.estate,
              size: iconSize,
            ),
            label: ''),
        BottomNavigationBarItem(
            icon: Icon(
              UniconsLine.compass,
              size: iconSize,
            ),
            label: ''),
        BottomNavigationBarItem(
            icon: Icon(
              UniconsLine.bookmark,
              size: iconSize,
            ),
            label: ''),
        BottomNavigationBarItem(
            icon: Icon(
              UniconsLine.comment_alt_dots,
              size: iconSize,
            ),
            label: ''),
      ],
    );
  }
}
