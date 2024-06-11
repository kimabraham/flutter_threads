import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thread_clone/constants/sizes.dart';
import 'package:thread_clone/features/main_navigation/widgets/nav_tab.dart';
import 'package:thread_clone/features/threads/thread.dart';

class NavTabItem {
  final IconData icon;

  NavTabItem({required this.icon});
}

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  void _onNavTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<NavTabItem> navTabs = [
    NavTabItem(icon: FontAwesomeIcons.house),
    NavTabItem(icon: FontAwesomeIcons.magnifyingGlass),
    NavTabItem(icon: FontAwesomeIcons.penToSquare),
    NavTabItem(icon: FontAwesomeIcons.heart),
    NavTabItem(icon: FontAwesomeIcons.user),
  ];

  @override
  void initState() {
    super.initState();
  }

  final List<Widget> screens = [
    const Thread(),
    const Center(
      child: Text(
        'Search',
      ),
    ),
    const Center(
      child: Text(
        'New post',
      ),
    ),
    const Center(
      child: Text(
        'Heart',
      ),
    ),
    const Center(
      child: Text(
        'Profile',
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const FaIcon(
          FontAwesomeIcons.threads,
          size: Sizes.size40,
        ),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        toolbarHeight: Sizes.size40,
      ),
      body: Stack(
        children: List.generate(
          screens.length,
          (index) {
            var screen = screens[index];
            return Offstage(
              offstage: _currentIndex != index,
              child: screen,
            );
          },
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: Sizes.size44,
        color: Colors.white,
        padding: EdgeInsets.zero,
        notchMargin: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(navTabs.length, (index) {
            var tab = navTabs[index];
            return NavTab(
              icon: tab.icon,
              onTap: () => _onNavTap(index),
              isSelected: _currentIndex == index,
            );
          }),
        ),
      ),
    );
  }
}