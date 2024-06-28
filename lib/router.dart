import 'package:go_router/go_router.dart';
import 'package:thread_clone/common/widgets/main_navigation/main_navigation_screen.dart';
import 'package:thread_clone/features/activity/activity_screen.dart';
import 'package:thread_clone/features/profile/user_profile_screen.dart';
import 'package:thread_clone/features/search/search_screen.dart';
import 'package:thread_clone/features/setting/views/privacy_screen.dart';
import 'package:thread_clone/features/setting/views/setting_screen.dart';
import 'package:thread_clone/features/threads/thread.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: Thread.routeURL,
      name: Thread.routeName,
      builder: (context, state) => const MainNavigationScreen(tab: ''),
    ),
    GoRoute(
      path: SearchScreen.routeURL,
      name: SearchScreen.routeName,
      builder: (context, state) => const MainNavigationScreen(tab: 'search'),
    ),
    GoRoute(
      path: ActivityScreen.routeURL,
      name: ActivityScreen.routeName,
      builder: (context, state) => const MainNavigationScreen(tab: 'activity'),
    ),
    GoRoute(
      path: UserProfileScreen.routeURL,
      name: UserProfileScreen.routeName,
      builder: (context, state) => const MainNavigationScreen(tab: 'profile'),
    ),
    GoRoute(
      path: SettingScreen.routeURL,
      name: SettingScreen.routeName,
      builder: (context, state) => const SettingScreen(),
      routes: [
        GoRoute(
          path: PrivacyScreen.routeURL,
          name: PrivacyScreen.routeName,
          builder: (context, state) => const PrivacyScreen(),
        ),
      ],
    ),
  ],
);
