import 'package:flutter/material.dart';
import 'package:rankai/core/theme/extensions/text_extensions.dart';
import 'package:rankai/core/theme/rankai_palette.dart';

class RankaiTextButton extends StatelessWidget {
  final String title;
  final Color foregroundColor;
  final VoidCallback? onPressed;

  factory RankaiTextButton.darkGrey({
    Key? key,
    required String title,
    VoidCallback? onPressed,
  }) {
    return RankaiTextButton._(
      key: key,
      title: title,
      foregroundColor: RankaiPalette.darkGrey,
      onPressed: onPressed,
    );
  }

  factory RankaiTextButton.white({
    Key? key,
    required String title,
    VoidCallback? onPressed,
  }) {
    return RankaiTextButton._(
      key: key,
      title: title,
      foregroundColor: Colors.white,
      onPressed: onPressed,
    );
  }

  const RankaiTextButton._({
    Key? key,
    required this.title,
    required this.foregroundColor,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        textStyle: MaterialStatePropertyAll(RankaiTextStyles.pRegularSemiBold),
        foregroundColor: MaterialStatePropertyAll(foregroundColor),
      ),
      child: Text(title),
    );
  }
}
