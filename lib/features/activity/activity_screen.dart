import 'package:flutter/material.dart';
import 'package:thread_clone/constants/sizes.dart';
import 'package:thread_clone/features/activity/widgets/activity_list_item.dart';
import 'package:thread_clone/model/reply_model.dart';

class ActivityScreen extends StatefulWidget {
  static const routeURL = '/activity';
  static const routeName = 'activity';

  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<String> _tabs = [
    'All',
    'Replies',
    'Mentions',
    'Likes',
    'Retweets',
    'Follows',
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: _tabs.length);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Text(
              'Activity',
              style: TextStyle(
                fontSize: Sizes.size30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          overlayColor: WidgetStateColor.transparent,
          indicatorColor: Colors.transparent,
          labelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          labelColor: Colors.white,
          unselectedLabelColor: Colors.black,
          labelPadding: EdgeInsets.zero,
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size15,
          ),
          dividerHeight: 0,
          tabAlignment: TabAlignment.start,
          tabs: _tabs
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
                        color: _tabController.index == _tabs.indexOf(tab)
                            ? Colors.black
                            : Colors.white,
                        border: Border.all(
                          color: Colors.grey.shade300,
                        ),
                        borderRadius: BorderRadius.circular(
                          Sizes.size8,
                        ),
                      ),
                      child: Text(tab),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: _tabs.map((tab) {
          return ListView(
            children: [
              for (var reply in mockReplies) ActivityListItem(data: reply)
            ],
          );
        }).toList(),
      ),
    );
  }
}
