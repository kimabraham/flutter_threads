import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thread_clone/constants/gaps.dart';
import 'package:thread_clone/constants/sizes.dart';
import 'package:thread_clone/model/thread_model.dart';

class ThreadCard extends StatelessWidget {
  final ThreadModel thread;

  const ThreadCard({
    super.key,
    required this.thread,
  });

  String _formatSocialStats() {
    String repliesText =
        thread.replies!.isNotEmpty ? '${thread.replies!.length} replies' : '';
    String likesText = thread.likes != 0 ? '${thread.likes} likes' : '';

    if (thread.replies!.isNotEmpty && thread.likes != 0) {
      return '$repliesText · $likesText';
    } else if (thread.replies!.isNotEmpty) {
      return repliesText;
    } else if (thread.likes != 0) {
      return likesText;
    } else {
      return '';
    }
  }

  String _timeAgoSinceDate() {
    final now = DateTime.now();
    final diff = now.difference(thread.createdAt);

    int years = now.year - thread.createdAt.year;
    int months = now.month - thread.createdAt.month;
    int days = now.day - thread.createdAt.day;
    int hours = diff.inHours % 24;
    int minutes = diff.inMinutes % 60;

    if (days < 0) {
      months -= 1;
      final prevMonth = DateTime(now.year, now.month, 0);
      days += prevMonth.day;
    }

    if (months < 0) {
      years -= 1;
      months += 12;
    }

    String result = '';
    if (years > 0) result += '${years}Y ';
    if (months > 0) result += '${months}M ';
    if (days > 0) result += '${days}D ';
    if (hours > 0) result += '${hours}h ';
    if (minutes > 0) result += '${minutes}m ';

    return result.isEmpty ? 'just now' : '${result}ago';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.size12,
        vertical: Sizes.size14,
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
                    SizedBox(
                      width: 48,
                      height: 48,
                      child: Center(
                        child: CircleAvatar(
                          minRadius: 20,
                          maxRadius: 20,
                          backgroundImage:
                              NetworkImage(thread.writer.avatarUrl),
                        ),
                      ),
                    ),
                    Gaps.v10,
                    if (thread.replies!.isNotEmpty)
                      Expanded(
                        child: Container(
                          width: 2,
                          color: Colors.grey[300],
                        ),
                      ),
                  ],
                ),
                Gaps.h8,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            thread.writer.username,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: Sizes.size15,
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                _timeAgoSinceDate(),
                                style: const TextStyle(
                                  fontSize: Sizes.size14,
                                  color: Colors.grey,
                                ),
                              ),
                              Gaps.h10,
                              const FaIcon(
                                FontAwesomeIcons.ellipsis,
                                size: Sizes.size18,
                              )
                            ],
                          )
                        ],
                      ),
                      Gaps.v2,
                      Text(
                        thread.content,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: Sizes.size15,
                        ),
                      ),
                      Gaps.v16,
                      if (thread.imageUrl!.isNotEmpty &&
                          thread.imageUrl!.length == 1)
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.grey.withOpacity(0.3),
                            ),
                            borderRadius: BorderRadius.circular(
                              Sizes.size10,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                              Sizes.size10,
                            ),
                            child: Image(
                              image: NetworkImage(thread.imageUrl!.first),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      if (thread.imageUrl!.isNotEmpty &&
                          thread.imageUrl!.length > 1)
                        SizedBox(
                          height: 220,
                          child: PageView.builder(
                            controller: PageController(
                              viewportFraction: 0.95,
                            ),
                            scrollDirection: Axis.horizontal,
                            itemCount: thread.imageUrl!.length,
                            itemBuilder: (context, index) {
                              var imageUrl = thread.imageUrl![index];
                              return Container(
                                margin: EdgeInsets.only(
                                  left: index == 0 ? 0 : Sizes.size5,
                                  right: index == thread.imageUrl!.length - 1
                                      ? 0
                                      : Sizes.size5,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: NetworkImage(imageUrl),
                                      fit: BoxFit.cover),
                                ),
                                clipBehavior: Clip.hardEdge,
                              );
                            },
                            clipBehavior: Clip.none,
                          ),
                        ),
                      Gaps.v12,
                      const Row(
                        children: [
                          FaIcon(
                            FontAwesomeIcons.heart,
                            size: Sizes.size20,
                          ),
                          Gaps.h14,
                          FaIcon(
                            FontAwesomeIcons.comment,
                            size: Sizes.size20,
                          ),
                          Gaps.h14,
                          FaIcon(
                            FontAwesomeIcons.retweet,
                            size: Sizes.size20,
                          ),
                          Gaps.h14,
                          FaIcon(
                            FontAwesomeIcons.paperPlane,
                            size: Sizes.size20,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Gaps.v8,
          Row(
            children: [
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(Sizes.size2),
                    width: 48,
                    height: thread.replies!.length <= 2 ? 28 : 48,
                    child: Stack(
                      children: [
                        if (thread.replies!.length > 2) ...[
                          Positioned(
                            top: 0,
                            right: 0,
                            child: CircleAvatar(
                              maxRadius: Sizes.size12,
                              backgroundImage: NetworkImage(
                                thread.replies!.first.writer.avatarUrl,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 12,
                            left: 0,
                            child: CircleAvatar(
                              maxRadius: Sizes.size8,
                              backgroundImage: NetworkImage(
                                thread.replies![1].writer.avatarUrl,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 28,
                            left: 14,
                            child: CircleAvatar(
                              maxRadius: Sizes.size6,
                              backgroundImage: NetworkImage(
                                thread.replies![2].writer.avatarUrl,
                              ),
                            ),
                          ),
                        ] else if (thread.replies!.length == 2) ...[
                          Positioned(
                            top: Sizes.size2,
                            left: Sizes.size4,
                            child: CircleAvatar(
                              maxRadius: Sizes.size10,
                              backgroundImage: NetworkImage(
                                thread.replies!.first.writer.avatarUrl,
                              ),
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
                                backgroundImage: NetworkImage(
                                  thread.replies!.last.writer.avatarUrl,
                                ),
                              ),
                            ),
                          ),
                        ] else if (thread.replies!.length == 1) ...[
                          Center(
                            child: CircleAvatar(
                              maxRadius: Sizes.size12,
                              backgroundImage: NetworkImage(
                                thread.replies!.first.writer.avatarUrl,
                              ),
                            ),
                          ),
                        ]
                      ],
                    ),
                  )
                ],
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
          )
        ],
      ),
    );
  }
}
