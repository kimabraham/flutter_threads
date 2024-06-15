import 'package:flutter/material.dart';
import 'package:thread_clone/constants/sizes.dart';
import 'package:thread_clone/features/activity/widgets/activity_list_item.dart';

final List<String> tabs = [
  'All',
  'Replies',
  'Mentions',
  'Likes',
  'Retweets',
  'Follows',
];

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          leading: const Padding(
            padding: EdgeInsets.only(
              top: Sizes.size15,
              right: Sizes.size20,
              left: Sizes.size20,
            ),
            child: Text(
              'Activity',
              style: TextStyle(
                fontSize: Sizes.size32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          leadingWidth: 200,
          toolbarHeight: 60,
          bottom: TabBar(
            isScrollable: true,
            overlayColor: WidgetStateColor.transparent,
            indicatorColor: Colors.transparent,
            labelStyle: const TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
            unselectedLabelColor: Colors.black,
            labelPadding: EdgeInsets.zero,
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size15,
            ),
            dividerHeight: 0,
            tabAlignment: TabAlignment.start,
            tabs: tabs
                .map(
                  (tab) => Tab(
                    child: Padding(
                      padding: const EdgeInsets.all(
                        Sizes.size5,
                      ),
                      child: Container(
                        width: 100,
                        height: 30,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey.shade300,
                          ),
                          borderRadius: BorderRadius.circular(
                            Sizes.size8,
                          ),
                        ),
                        child: Text(
                          tab,
                          style: TextStyle(
                            color: DefaultTabController.of(context).index ==
                                    tabs.indexOf(tab)
                                ? Colors.white
                                : Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        body: TabBarView(
          children: tabs.map((tab) {
            return ListView(
              children: const [
                ActivityListItem(
                  isFollow: false,
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
