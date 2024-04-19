import 'package:flutter/material.dart';
import 'package:rankai/core/theme/rankai_palette.dart';

class NextButton extends StatelessWidget {
  final void Function() onPressed;

  const NextButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: RankaiPalette.darkGrey,
        shape: const CircleBorder(),
      ),
      child: IconButton(
        icon: const Icon(Icons.chevron_right_rounded),
        color: Colors.white,
        onPressed: onPressed,
      ),
    );
  }
}
