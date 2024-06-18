import 'package:flutter/material.dart';
import 'package:thread_clone/constants/sizes.dart';

class PersistentTabBar extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: TabBar(
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorColor: Colors.black,
        indicatorPadding: EdgeInsets.zero,
        labelStyle: const TextStyle(
          fontSize: Sizes.size16,
          fontWeight: FontWeight.bold,
        ),
        labelColor: Colors.black,
        labelPadding: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        unselectedLabelColor: Colors.grey.shade500,
        overlayColor: WidgetStateColor.transparent,
        dividerHeight: 0.5,
        tabs: const [
          Text('Threads'),
          Text('Replies'),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 41;

  @override
  double get minExtent => 41;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
