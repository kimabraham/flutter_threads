import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:thread_clone/constants/gaps.dart';
import 'package:thread_clone/constants/sizes.dart';
import 'package:thread_clone/features/setting/view_model/dark_mode_vm.dart';

class PrivacyScreen extends StatefulWidget {
  static const routeURL = 'privacy';
  static const routeName = 'privacy';

  const PrivacyScreen({
    super.key,
  });

  @override
  State<PrivacyScreen> createState() => _PrivacyScreenState();
}

final List<Map<String, Object>> privacyList = [
  {
    'icon': FontAwesomeIcons.lock,
    'title': 'Private profile',
    'subTitle': '',
    'endIcon': FontAwesomeIcons.chevronRight
  },
  {
    'icon': FontAwesomeIcons.lock,
    'title': 'Dark mode',
    'subTitle': '',
    'endIcon': FontAwesomeIcons.chevronRight
  },
  {
    'icon': FontAwesomeIcons.at,
    'title': 'Mentions',
    'subTitle': '',
    'endIcon': FontAwesomeIcons.chevronRight
  },
  {
    'icon': FontAwesomeIcons.bellSlash,
    'title': 'Muted',
    'subTitle': '',
    'endIcon': FontAwesomeIcons.chevronRight
  },
  {
    'icon': FontAwesomeIcons.eyeSlash,
    'title': 'Hidden Words',
    'subTitle': '',
    'endIcon': FontAwesomeIcons.chevronRight
  },
  {
    'icon': FontAwesomeIcons.users,
    'title': 'Profiles you follow',
    'subTitle': '',
    'endIcon': FontAwesomeIcons.chevronRight
  },
  {
    'icon': FontAwesomeIcons.circleXmark,
    'title': 'Other privacy settings',
    'subTitle':
        'Some settings, like restrict, apply to both Threads and Instagram and can be managed on Instagram.',
    'endIcon': FontAwesomeIcons.arrowUpRightFromSquare
  },
  {
    'icon': FontAwesomeIcons.circleXmark,
    'title': 'Blocked profiles',
    'subTitle': '',
    'endIcon': FontAwesomeIcons.arrowUpRightFromSquare
  },
  {
    'icon': FontAwesomeIcons.heartCircleXmark,
    'title': 'Hide likes',
    'subTitle': '',
    'endIcon': FontAwesomeIcons.arrowUpRightFromSquare
  },
];

class _PrivacyScreenState extends State<PrivacyScreen> {
  bool _isPrivacy = false;

  void _onTapIsPrivacy(bool? value) {
    if (value != null) {
      setState(
        () {
          _isPrivacy = value;
        },
      );
    }
  }

  void _onTapToggleDarkMode(bool value) {
    context.read<DarkModeVm>().setDarked(value);
  }

  void _onTapBackPressed() {
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy'),
        leadingWidth: Sizes.size96,
        leading: GestureDetector(
          onTap: _onTapBackPressed,
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
          for (var i = 0; i < privacyList.length; i++)
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: i == 5
                        ? Theme.of(context).unselectedWidgetColor
                        : Colors.transparent,
                    width: 0.5,
                  ),
                ),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: Sizes.size20,
                ),
                minLeadingWidth: Sizes.size28,
                leading: i != 6
                    ? FaIcon(
                        privacyList[i]['icon'] as IconData,
                        size: Sizes.size18,
                      )
                    : null,
                title: Text(
                  privacyList[i]['title'] as String,
                  style: TextStyle(
                    fontWeight: i == 6 ? FontWeight.w800 : null,
                  ),
                ),
                subtitle: i == 6
                    ? Text(
                        privacyList[i]['subTitle'] as String,
                        style: TextStyle(
                          color: Colors.grey.shade600,
                        ),
                      )
                    : null,
                trailing: i == 0 || i == 1
                    ? Switch.adaptive(
                        value: i == 0
                            ? _isPrivacy
                            : context.watch<DarkModeVm>().darked,
                        onChanged:
                            i == 0 ? _onTapIsPrivacy : _onTapToggleDarkMode,
                        activeColor: Theme.of(context).unselectedWidgetColor,
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: Sizes.size10,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (i == 2)
                              Text(
                                'EveryOne',
                                style: TextStyle(
                                  color: Colors.grey.shade500,
                                  fontSize: Sizes.size14,
                                ),
                              ),
                            Gaps.h10,
                            FaIcon(
                              privacyList[i]['endIcon'] as IconData,
                              size: Sizes.size18,
                              color: Colors.grey.shade500,
                            ),
                          ],
                        ),
                      ),
              ),
            ),
        ],
      ),
    );
  }
}
