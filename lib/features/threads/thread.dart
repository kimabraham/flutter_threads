import 'package:flutter/material.dart';
import 'package:thread_clone/constants/sizes.dart';
import 'package:thread_clone/features/threads/thread_card.dart';
import 'package:thread_clone/model/thread_model.dart';

class Thread extends StatelessWidget {
  const Thread({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) => ThreadCard(
              thread: mockThreads[index],
            ),
            separatorBuilder: (context, index) => Container(
              height: Sizes.size1 / 4,
              color: Colors.grey,
            ),
            itemCount: mockThreads.length,
          ),
        ),
      ],
    );
  }
}
