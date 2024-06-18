import 'package:flutter/material.dart';
import 'package:thread_clone/constants/gaps.dart';
import 'package:thread_clone/constants/sizes.dart';
import 'package:thread_clone/features/threads/widgets/thread_create_info.dart';
import 'package:thread_clone/features/threads/widgets/thread_item_icons.dart';
import 'package:thread_clone/features/threads/widgets/thread_item_image.dart';
import 'package:thread_clone/features/threads/widgets/thread_social_bottom.dart';
import 'package:thread_clone/features/threads/widgets/vertical_line.dart';
import 'package:thread_clone/model/thread_model.dart';

class ThreadCard extends StatelessWidget {
  final ThreadModel thread;

  const ThreadCard({
    super.key,
    required this.thread,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        Sizes.size12,
      ),
      child: Column(
        children: [
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: Sizes.size24,
                      backgroundImage: NetworkImage(
                        thread.writer.avatarUrl,
                      ),
                      backgroundColor: Colors.transparent,
                    ),
                    Gaps.v10,
                    if (thread.replies!.isNotEmpty) const VerticalLine()
                  ],
                ),
                Gaps.h8,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ThreadCreateInfo(
                        writer: thread.writer,
                        createdAt: thread.createdAt,
                      ),
                      Text(
                        thread.content,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: Sizes.size15,
                        ),
                      ),
                      Gaps.v16,
                      ThreadItemImage(imageUrls: thread.imageUrl!),
                      Gaps.v16,
                      const ThreadItemIcons()
                    ],
                  ),
                ),
              ],
            ),
          ),
          Gaps.v8,
          ThreadSocialBottom(
            replies: thread.replies!,
            likes: thread.likes!,
          )
        ],
      ),
    );
  }
}
