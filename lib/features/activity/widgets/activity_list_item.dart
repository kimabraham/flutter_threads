import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thread_clone/constants/gaps.dart';
import 'package:thread_clone/constants/sizes.dart';
import 'package:thread_clone/model/reply_model.dart';
import 'package:thread_clone/model/user_model.dart';

class ActivityListItem extends StatefulWidget {
  final dynamic data;

  const ActivityListItem({
    super.key,
    required this.data,
  });

  @override
  State<ActivityListItem> createState() => _ActivityListItemState();
}

class _ActivityListItemState extends State<ActivityListItem> {
  String _timeAgoSinceDate(DateTime time) {
    final now = DateTime.now();

    final diff = now.difference(time);

    int years = now.year - time.year;
    int months = now.month - time.month;
    int days = now.day - time.day;
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
    if (hours > 0) result += '${hours}H ';
    if (minutes > 0) result += '${minutes}M ';

    return result.isEmpty ? 'just now' : result;
  }

  void _onTapFollow() {
    setState(() {
      currentUser.following.add(widget.data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: Sizes.size10,
        left: Sizes.size20,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: Sizes.size20,
            backgroundImage: NetworkImage(widget.data is UserModel
                ? widget.data.avatarUrl
                : widget.data.writer.avatarUrl),
            backgroundColor: Colors.transparent,
          ),
          Gaps.h14,
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    right: Sizes.size20,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  widget.data is UserModel
                                      ? widget.data.id
                                      : widget.data.writer.id,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Gaps.h4,
                                if (widget.data is UserModel &&
                                    widget.data.isOfficital)
                                  const FaIcon(
                                    FontAwesomeIcons.solidCircleCheck,
                                    color: Colors.blue,
                                    size: Sizes.size12,
                                  ),
                                if (widget.data is ReplyModel)
                                  Text(
                                    _timeAgoSinceDate(widget.data.createdAt),
                                    style: TextStyle(
                                      color: Colors.grey.shade400,
                                      fontWeight: FontWeight.w400,
                                      fontSize: Sizes.size14,
                                    ),
                                  ),
                              ],
                            ),
                            Text(
                              widget.data is UserModel
                                  ? widget.data.username
                                  : widget.data.writer.username,
                              style: TextStyle(
                                color: Colors.grey.shade400,
                                fontWeight: FontWeight.w400,
                                fontSize: Sizes.size14,
                              ),
                            ),
                            Text(
                              widget.data is UserModel
                                  ? '${widget.data.follower.length} followers'
                                  : widget.data.content,
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: Sizes.size14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (widget.data is UserModel &&
                          !currentUser.following.contains(widget.data))
                        GestureDetector(
                          onTap: _onTapFollow,
                          child: Container(
                            width: 100,
                            height: 35,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey.shade400,
                                width: Sizes.size1,
                              ),
                              borderRadius: BorderRadius.circular(
                                Sizes.size10,
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                'Follow',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        )
                    ],
                  ),
                ),
                Gaps.v10,
                Divider(
                  color: Colors.grey.shade400,
                  thickness: 0.3,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
