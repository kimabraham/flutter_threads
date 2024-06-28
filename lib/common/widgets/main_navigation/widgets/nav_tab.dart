import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thread_clone/constants/sizes.dart';

class NavTab extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final void Function() onTap;

  const NavTab({
    super.key,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          child: TweenAnimationBuilder(
            duration: const Duration(milliseconds: 200),
            tween: ColorTween(
              begin: Theme.of(context).unselectedWidgetColor,
              end: isSelected
                  ? Theme.of(context).primaryColorDark
                  : Theme.of(context).unselectedWidgetColor,
            ),
            builder: (context, value, child) =>
                FaIcon(icon, size: Sizes.size24, color: value),
          ),
        ),
      ),
    );
  }
}
