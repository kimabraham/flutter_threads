import 'package:flutter/material.dart';
import 'package:thread_clone/constants/gaps.dart';
import 'package:thread_clone/constants/sizes.dart';

class ActivityListItem extends StatelessWidget {
  final bool isFollow;

  const ActivityListItem({super.key, required this.isFollow});

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
          const CircleAvatar(
            radius: Sizes.size20,
            backgroundImage: NetworkImage('https://picsum.photos/200/200'),
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
                            RichText(
                              text: TextSpan(
                                style: DefaultTextStyle.of(context).style,
                                children: const [
                                  TextSpan(
                                    text: 'john_mobbin',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' 4h',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Text(
                              'Mentioned you',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: Sizes.size14,
                                fontWeight: FontWeight.w500,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const Text(
                              'Here\'s a thread you should follow if you love botany @jane_mobbin',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: Sizes.size14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (isFollow)
                        Container(
                          width: 100,
                          height: 35,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey.shade400,
                                width: Sizes.size1,
                              ),
                              borderRadius: BorderRadius.circular(
                                Sizes.size10,
                              )),
                          child: Center(
                            child: Text(
                              'Follow',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade400,
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
