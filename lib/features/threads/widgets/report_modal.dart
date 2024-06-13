import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thread_clone/constants/gaps.dart';
import 'package:thread_clone/constants/sizes.dart';

class ReportModal extends StatelessWidget {
  ReportModal({super.key});

  final List<String> reasons = [
    'I just don\'t like it',
    'It\'s unlawful content under NetzDG',
    'It\'s spam',
    'Hate speech or symbol',
    'Nudity or sexual activity',
    'Violence or dangerous organizations',
    'Harassment or bullying',
    'Intellectual property violation',
  ];

  Widget buildCustomListTile(BuildContext context, String title) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade300,
            width: 1.0,
          ),
        ),
      ),
      child: ListTile(
        title: Text(title),
        trailing: FaIcon(
          FontAwesomeIcons.chevronRight,
          size: 15,
          color: Colors.grey.shade600,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: Sizes.size24),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(
              bottom: Sizes.size14,
            ),
            child: const Text(
              'Report',
              style: TextStyle(
                fontSize: Sizes.size18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Divider(
            height: 0.2,
            color: Colors.grey.shade300,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Sizes.size16,
                      vertical: Sizes.size20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Why are you reporting this thread?',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: Sizes.size16,
                          ),
                        ),
                        Gaps.v10,
                        Text(
                          'Your report is anonymous, except if you\'re reporting an intellectual property infringement. If someone is in immediate danger, call the local emergency services - don\'t wait.',
                          style: TextStyle(
                            fontSize: Sizes.size14,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 0.2,
                    color: Colors.grey.shade300,
                  ),
                  ...reasons
                      .map((reason) => buildCustomListTile(context, reason))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
