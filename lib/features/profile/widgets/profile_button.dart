import 'package:flutter/material.dart';
import 'package:thread_clone/constants/sizes.dart';

class ProfileButton extends StatelessWidget {
  final String text;

  const ProfileButton({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.size8,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.shade300,
            width: Sizes.size1,
          ),
          borderRadius: BorderRadius.circular(
            Sizes.size8,
          ),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: Sizes.size15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
