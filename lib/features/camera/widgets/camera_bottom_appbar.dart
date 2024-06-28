import 'package:flutter/material.dart';
import 'package:thread_clone/constants/sizes.dart';

class CameraBottomAppBar extends StatelessWidget {
  final Future<void> Function() onPressLibrary;

  const CameraBottomAppBar({
    super.key,
    required this.onPressLibrary,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.black,
      padding: EdgeInsets.zero,
      child: Row(
        children: [
          const Expanded(
            child: SizedBox(),
          ),
          const Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'Camera',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: Sizes.size18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: onPressLibrary,
                child: const Text(
                  'Library',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Sizes.size18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
