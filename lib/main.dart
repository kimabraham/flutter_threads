import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thread_clone/constants/sizes.dart';
import 'package:thread_clone/features/setting/repos/dark_mode_repo.dart';
import 'package:thread_clone/features/setting/view_model/dark_mode_vm.dart';
import 'package:thread_clone/model/user_model.dart';
import 'package:thread_clone/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeFollowersAndFollowings();

  final preferences = await SharedPreferences.getInstance();
  final repo = DarkModeRepo(preferences);

  runApp(ProviderScope(overrides: [
    darkModeProvider.overrideWith(
      () => DarkModeVm(repo),
    ),
  ], child: const ThreadClone()));
}

class ThreadClone extends ConsumerWidget {
  const ThreadClone({super.key});

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Threads clone',
      themeMode: ref.watch(darkModeProvider).isDarkMode
          ? ThemeMode.dark
          : ThemeMode.light,
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        primaryColorDark: Colors.black,
        primaryColorLight: Colors.white,
        unselectedWidgetColor: Colors.grey,
        primaryColor: const Color(0xFFE9435A),
        appBarTheme: const AppBarTheme(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: Sizes.size18,
            fontWeight: FontWeight.w600,
          ),
        ),
        bottomAppBarTheme: const BottomAppBarTheme(
          color: Colors.white,
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        primaryColorDark: Colors.white,
        primaryColorLight: Colors.black,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          surfaceTintColor: Colors.black,
          actionsIconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
        bottomAppBarTheme: const BottomAppBarTheme(
          color: Colors.black,
        ),
      ),
    );
  }
}
