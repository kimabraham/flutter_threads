import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thread_clone/constants/gaps.dart';
import 'package:thread_clone/constants/sizes.dart';
import 'package:thread_clone/features/threads/widgets/more_modal.dart';
import 'package:thread_clone/model/user_model.dart';

class ThreadCreateInfo extends StatelessWidget {
  final UserModel writer;
  final DateTime createdAt;
  const ThreadCreateInfo({
    super.key,
    required this.writer,
    required this.createdAt,
  });

  String _timeAgoSinceDate() {
    final now = DateTime.now();

    final diff = now.difference(createdAt);

    int years = now.year - createdAt.year;
    int months = now.month - createdAt.month;
    int days = now.day - createdAt.day;
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

    return result.isEmpty ? 'just now' : result;
  }

  void _onEllipsisTap(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.white,
        showDragHandle: true,
        context: context,
        builder: (context) => const MoreModal());
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          writer.username,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: Sizes.size15,
          ),
        ),
        Gaps.h5,
        if (writer.isOfficital)
          const FaIcon(
            FontAwesomeIcons.solidCircleCheck,
            size: Sizes.size16,
            color: Colors.blue,
          ),
        const Spacer(),
        Text(
          _timeAgoSinceDate(),
          style: const TextStyle(
            fontSize: Sizes.size10,
            color: Colors.grey,
          ),
        ),
        IconButton(
          onPressed: () => _onEllipsisTap(context),
          iconSize: Sizes.size20,
          icon: const FaIcon(
            FontAwesomeIcons.ellipsis,
          ),
        )
      ],
    );
  }
}
