import 'package:flutter/material.dart';
import 'package:thread_clone/constants/sizes.dart';
import 'package:thread_clone/features/main_navigation/main_navigation_screen.dart';

void main() {
  runApp(const ThreadClone());
}

class ThreadClone extends StatelessWidget {
  const ThreadClone({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Threads clone',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: const Color(0xFFE9435A),
        appBarTheme: const AppBarTheme(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: Sizes.size18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      home: const MainNavigationScreen(),
    );
  }
}
