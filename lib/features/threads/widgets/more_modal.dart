import 'package:flutter/material.dart';
import 'package:thread_clone/constants/gaps.dart';
import 'package:thread_clone/constants/sizes.dart';
import 'package:thread_clone/features/threads/widgets/report_modal.dart';

class MoreModal extends StatelessWidget {
  const MoreModal({super.key});

  void _onReportTap(BuildContext context) {
    Navigator.pop(context);
    showModalBottomSheet(
      backgroundColor: Colors.white,
      showDragHandle: true,
      clipBehavior: Clip.hardEdge,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(
            Sizes.size16,
          ),
        ),
      ),
      scrollControlDisabledMaxHeightRatio: 0.65,
      context: context,
      builder: (context) => ReportModal(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: Sizes.size24,
        right: Sizes.size24,
        bottom: Sizes.size60,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: const BorderRadius.all(
                Radius.circular(Sizes.size20),
              ),
            ),
            child: const Column(
              children: [
                ListTile(
                  title: Text(
                    'Unfollow',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Divider(height: 1),
                ListTile(
                  title: Text(
                    'Mute',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Gaps.v20,
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: const BorderRadius.all(
                Radius.circular(Sizes.size20),
              ),
            ),
            child: Column(
              children: [
                const ListTile(
                  title: Text(
                    'Hide',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Divider(height: 1),
                ListTile(
                  onTap: () => _onReportTap(context),
                  title: const Text(
                    'Report',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
