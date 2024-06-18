import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thread_clone/constants/gaps.dart';
import 'package:thread_clone/constants/sizes.dart';
import 'package:thread_clone/features/activity/widgets/activity_list_item.dart';
import 'package:thread_clone/model/user_model.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();
  Iterable<UserModel> initUsers =
      allUsers.where((user) => user.username != currentUser.username);

  @override
  void initState() {
    super.initState();
    _controller.addListener(
      () {
        setState(
          () {
            initUsers = initUsers.where(
              (user) => user.id.toLowerCase().contains(
                    _controller.text.toLowerCase(),
                  ),
            );
          },
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Search',
              style: TextStyle(
                fontSize: Sizes.size30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Gaps.v10,
            CupertinoSearchTextField(
              controller: _controller,
            )
          ],
        ),
      ),
      body: ListView(children: [
        for (var user in initUsers) ActivityListItem(data: user),
      ]),
    );
  }
}
