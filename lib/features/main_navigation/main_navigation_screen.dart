import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thread_clone/constants/sizes.dart';
import 'package:thread_clone/features/activity/activity_screen.dart';
import 'package:thread_clone/features/main_navigation/widgets/nav_tab.dart';
import 'package:thread_clone/features/search/search_screen.dart';
import 'package:thread_clone/features/threads/thread.dart';
import 'package:thread_clone/features/threads/widgets/new_thread_modal.dart';

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
  int _currentIndex = 3;

  void _onCreateThread() {
    showModalBottomSheet(
      context: context,
      scrollControlDisabledMaxHeightRatio: 0.9,
      builder: (context) => NewThreadModal(),
    );
  }

  void _onNavTap(int index) {
    if (index == 2) {
      _onCreateThread();
      setState(() {});
      return;
    }
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
    const SearchScreen(),
    const Center(
      child: Text('New post'),
    ),
    ActivityScreen(),
    const Center(
      child: Text('Profile'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _currentIndex != 1 && _currentIndex != 3
          ? AppBar(
              title: const FaIcon(
                FontAwesomeIcons.threads,
                size: Sizes.size40,
              ),
              backgroundColor: Colors.white,
              surfaceTintColor: Colors.white,
              toolbarHeight: Sizes.size40,
            )
          : null,
      body: Stack(
        children: List.generate(
          screens.length,
          (index) {
            var screen = screens.elementAt(index);

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
