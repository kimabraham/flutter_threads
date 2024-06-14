import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thread_clone/constants/gaps.dart';
import 'package:thread_clone/constants/sizes.dart';
import 'package:thread_clone/features/threads/widgets/vertical_line.dart';
import 'package:thread_clone/model/user_model.dart';

class NewThreadModal extends StatelessWidget {
  final UserModel currentUser = UserModel(
    username: 'kim_abraham',
    avatarUrl: 'https://avatars.githubusercontent.com/u/43990334?v=4',
  );
  NewThreadModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(
            Sizes.size10,
          ),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          leading: TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              'Cancel',
              style: TextStyle(
                fontSize: Sizes.size18,
                letterSpacing: -.2,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          leadingWidth: 100,
          title: const Text('New Thread'),
          surfaceTintColor: Colors.white,
          backgroundColor: Colors.white,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1.0),
            child: Container(
              color: Colors.grey.shade300,
              height: 1.0,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.size14,
            horizontal: Sizes.size12,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                IntrinsicHeight(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ConstrainedBox(
                        constraints: const BoxConstraints(
                          minHeight: 140,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              radius: Sizes.size24,
                              backgroundImage: NetworkImage(
                                currentUser.avatarUrl,
                              ),
                            ),
                            Gaps.v10,
                            const VerticalLine(),
                            Gaps.v10,
                            Opacity(
                              opacity: 0.5,
                              child: CircleAvatar(
                                radius: Sizes.size12,
                                backgroundImage: NetworkImage(
                                  currentUser.avatarUrl,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Gaps.h10,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              currentUser.username,
                              style: const TextStyle(
                                fontSize: Sizes.size16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: TextField(
                                expands: true,
                                minLines: null,
                                maxLines: null,
                                cursorColor: Colors.blue,
                                scrollPadding: const EdgeInsets.symmetric(
                                    vertical: Sizes.size96),
                                decoration: InputDecoration(
                                  hintText: "Start a thread...",
                                  hintStyle: TextStyle(
                                    color: Colors.grey.shade400,
                                  ),
                                  border: const UnderlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                            ),
                            Gaps.v10,
                            Padding(
                              padding: const EdgeInsets.only(
                                bottom: Sizes.size48,
                              ),
                              child: FaIcon(
                                FontAwesomeIcons.paperclip,
                                color: Colors.grey.shade400,
                                size: Sizes.size20,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
