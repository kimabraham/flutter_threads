import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thread_clone/constants/gaps.dart';
import 'package:thread_clone/constants/sizes.dart';

class ThreadItemIcons extends StatelessWidget {
  const ThreadItemIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
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
    );
  }
}
