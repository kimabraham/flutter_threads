import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thread_clone/constants/gaps.dart';
import 'package:thread_clone/constants/sizes.dart';
import 'package:thread_clone/features/profile/widgets/persistent_tab_bar.dart';
import 'package:thread_clone/features/profile/widgets/profile_button.dart';
import 'package:thread_clone/features/threads/thread_card.dart';
import 'package:thread_clone/model/thread_model.dart';
import 'package:thread_clone/model/user_model.dart';

class UserProfileScreen extends StatelessWidget {
  final void Function(int) onTap;

  const UserProfileScreen({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  pinned: true,
                  floating: true,
                  surfaceTintColor: Colors.white,
                  leading: const Padding(
                    padding: EdgeInsets.only(left: Sizes.size20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FaIcon(FontAwesomeIcons.globe),
                      ],
                    ),
                  ),
                  centerTitle: false,
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(
                        right: Sizes.size20,
                      ),
                      child: Row(
                        children: [
                          const FaIcon(FontAwesomeIcons.instagram),
                          Gaps.h16,
                          GestureDetector(
                            onTap: () => onTap(5),
                            child: const FaIcon(
                              FontAwesomeIcons.bars,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: Sizes.size20,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  currentUser.username,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: Sizes.size32,
                                  ),
                                ),
                                Gaps.v6,
                                Row(
                                  children: [
                                    Text(
                                      currentUser.id,
                                      style: const TextStyle(
                                        fontSize: Sizes.size18,
                                      ),
                                    ),
                                    Gaps.h8,
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: Sizes.size10,
                                        vertical: Sizes.size6,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade200,
                                        borderRadius: BorderRadius.circular(
                                          Sizes.size16,
                                        ),
                                      ),
                                      child: Text(
                                        'threads.net',
                                        style: TextStyle(
                                          fontSize: Sizes.size14,
                                          color: Colors.grey.shade500,
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            CircleAvatar(
                              radius: Sizes.size28,
                              foregroundImage: NetworkImage(
                                currentUser.avatarUrl,
                              ),
                            )
                          ],
                        ),
                      ),
                      Gaps.v10,
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Sizes.size20,
                        ),
                        child: Text(
                          'Plant enthusiast!',
                          style: TextStyle(
                            fontSize: Sizes.size18,
                          ),
                        ),
                      ),
                      Gaps.v24,
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: Sizes.size20,
                        ),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: Sizes.size52,
                              height: Sizes.size28,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: Sizes.size2,
                                    child: CircleAvatar(
                                      foregroundImage: NetworkImage(
                                          'https://avatars.githubusercontent.com/u/43990334?v=4'),
                                      radius: Sizes.size14,
                                    ),
                                  ),
                                  Positioned(
                                    right: Sizes.size2,
                                    child: CircleAvatar(
                                      foregroundImage: NetworkImage(
                                          'https://avatars.githubusercontent.com/u/810438?v=4'),
                                      radius: Sizes.size14,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Gaps.h12,
                            Text(
                              '${currentUser.follower.length} followers',
                              style: TextStyle(
                                fontSize: Sizes.size16,
                                color: Colors.grey.shade600,
                              ),
                            )
                          ],
                        ),
                      ),
                      Gaps.v24,
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Sizes.size20,
                        ),
                        child: Row(children: [
                          ProfileButton(text: 'Edit profile'),
                          Gaps.h10,
                          ProfileButton(text: 'Share profile'),
                        ]),
                      ),
                      Gaps.v10,
                    ],
                  ),
                ),
                SliverPersistentHeader(
                  delegate: PersistentTabBar(),
                  pinned: true,
                )
              ];
            },
            body: TabBarView(
              children: [
                ListView.builder(
                  itemCount: mockThreads.length,
                  itemBuilder: (context, index) =>
                      ThreadCard(thread: mockThreads[index]),
                ),
                ListView.builder(
                  itemCount: mockThreads.length,
                  itemBuilder: (context, index) =>
                      ThreadCard(thread: mockThreads[index]),
                ),
              ],
            )),
      ),
    );
  }
}
