import 'package:flutter/material.dart';
import 'package:thread_clone/constants/sizes.dart';
import 'package:thread_clone/model/reply_model.dart';

class ThreadSocialAvatar extends StatelessWidget {
  final List<ReplyModel> replies;

  const ThreadSocialAvatar({
    super.key,
    required this.replies,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: _buildAvatars(),
    );
  }

  List<Widget> _buildAvatars() {
    if (replies.isEmpty) return [];

    if (replies.length == 1) {
      return [
        Center(
          child: CircleAvatar(
            maxRadius: Sizes.size12,
            backgroundImage: NetworkImage(replies.first.writer.avatarUrl),
          ),
        ),
      ];
    }

    if (replies.length == 2) {
      return [
        Positioned(
          top: Sizes.size2,
          left: Sizes.size4,
          child: CircleAvatar(
            maxRadius: Sizes.size10,
            backgroundImage: NetworkImage(replies.first.writer.avatarUrl),
          ),
        ),
        Positioned(
          top: 0,
          right: Sizes.size2,
          child: Container(
            width: Sizes.size28 + Sizes.size1,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: 2,
              ),
            ),
            child: CircleAvatar(
              maxRadius: Sizes.size10,
              backgroundImage: NetworkImage(replies.last.writer.avatarUrl),
            ),
          ),
        ),
      ];
    }

    return [
      Positioned(
        top: 0,
        right: 0,
        child: CircleAvatar(
          maxRadius: Sizes.size12,
          backgroundImage: NetworkImage(replies.first.writer.avatarUrl),
        ),
      ),
      Positioned(
        top: Sizes.size12,
        left: 0,
        child: CircleAvatar(
          maxRadius: Sizes.size8,
          backgroundImage: NetworkImage(replies[1].writer.avatarUrl),
        ),
      ),
      Positioned(
        top: Sizes.size28,
        left: Sizes.size14,
        child: CircleAvatar(
          maxRadius: Sizes.size6,
          backgroundImage: NetworkImage(replies[2].writer.avatarUrl),
        ),
      ),
    ];
  }
}
