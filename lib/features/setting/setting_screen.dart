import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thread_clone/constants/gaps.dart';
import 'package:thread_clone/constants/sizes.dart';
import 'package:thread_clone/features/main_navigation/main_navigation_screen.dart';

class SettingScreen extends StatefulWidget {
  final void Function(int) onTap;

  const SettingScreen({super.key, required this.onTap});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool _isLogin = true;
  bool _isLoading = false;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _onTapLogout() {
    setState(() {
      _isLoading = true;
    });

    _timer = Timer(
      const Duration(seconds: 2),
      () {
        setState(() {
          _isLogin = !_isLogin;
          _isLoading = false;
        });

        showCupertinoDialog(
          context: context,
          builder: (BuildContext context) {
            return CupertinoAlertDialog(
              title: Text(_isLogin ? 'Login' : 'Logout'),
              content:
                  Text(_isLogin ? 'Hello world' : 'You have been logged out.'),
              actions: [
                TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

  final List<NavTabItem> navTabs = [
    NavTabItem(icon: FontAwesomeIcons.house),
    NavTabItem(icon: FontAwesomeIcons.magnifyingGlass),
    NavTabItem(icon: FontAwesomeIcons.penToSquare),
    NavTabItem(icon: FontAwesomeIcons.heart),
    NavTabItem(icon: FontAwesomeIcons.user),
  ];

  void _onTapListTile(BuildContext context, item) {
    if (item['title'] != settingList[2]['title']) {
      return;
    }
    widget.onTap(6);
  }

  final List<Map<String, Object>> settingList = [
    {'icon': FontAwesomeIcons.userPlus, 'title': 'Follow and invite friends'},
    {'icon': FontAwesomeIcons.bell, 'title': 'Notifications'},
    {'icon': FontAwesomeIcons.lock, 'title': 'Privicy'},
    {'icon': FontAwesomeIcons.user, 'title': 'Account'},
    {'icon': FontAwesomeIcons.circleQuestion, 'title': 'Help'},
    {'icon': FontAwesomeIcons.circleExclamation, 'title': 'About'},
  ];

  // TODO : logout 시 delay 한 후 show dialog
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        leadingWidth: Sizes.size96,
        leading: GestureDetector(
          onTap: () => widget.onTap(4),
          child: const Padding(
            padding: EdgeInsets.only(
              left: Sizes.size20,
            ),
            child: Row(
              children: [
                FaIcon(FontAwesomeIcons.chevronLeft),
                Gaps.h6,
                Text(
                  'Back',
                  style: TextStyle(
                    fontSize: Sizes.size18,
                  ),
                ),
              ],
            ),
          ),
        ),
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(Sizes.size1),
          child: Container(
            color: Colors.grey.shade500,
            height: 0.5,
          ),
        ),
      ),
      body: ListView(
        children: [
          for (var item in settingList)
            ListTile(
              onTap: () => _onTapListTile(context, item),
              leading: FaIcon(
                item['icon'] as IconData,
                color: Colors.black,
                size: Sizes.size18,
              ),
              title: Text(item['title'] as String),
            ),
          Divider(
            color: Colors.grey.shade400,
            thickness: 0.5,
          ),
          ListTile(
            onTap: _onTapLogout,
            title: Text(
              _isLogin ? 'Logout' : 'Login',
              style: const TextStyle(
                color: Colors.blue,
              ),
            ),
            trailing: _isLoading ? const CupertinoActivityIndicator() : null,
          )
        ],
      ),
    );
  }
}
