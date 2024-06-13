import 'package:flutter/material.dart';
import 'package:thread_clone/constants/gaps.dart';
import 'package:thread_clone/constants/sizes.dart';
import 'package:thread_clone/features/threads/widgets/thread_social_avatar.dart';
import 'package:thread_clone/model/reply_model.dart';

class ThreadSocialBottom extends StatelessWidget {
  final List<ReplyModel> replies;
  final int likes;

  const ThreadSocialBottom({
    super.key,
    required this.replies,
    required this.likes,
  });

  String _formatSocialStats() {
    String repliesText = replies.isNotEmpty ? '${replies.length} replies' : '';
    String likesText = likes != 0 ? '$likes likes' : '';

    if (replies.isNotEmpty && likes != 0) {
      return '$repliesText · $likesText';
    } else if (replies.isNotEmpty) {
      return repliesText;
    } else if (likes != 0) {
      return likesText;
    } else {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: Sizes.size48,
          height: replies.length <= 2 ? Sizes.size28 : Sizes.size48,
          child: ThreadSocialAvatar(
            replies: replies,
          ),
        ),
        Gaps.h10,
        Text(
          _formatSocialStats(),
          style: const TextStyle(
            fontSize: Sizes.size16,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
