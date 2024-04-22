import 'package:flutter/material.dart';
import 'package:rankai/core/theme/extensions/text_extensions.dart';
import 'package:rankai/core/theme/rankai_palette.dart';

class RankaiElevatedButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final bool isLoading;

  factory RankaiElevatedButton.darkGrey({
    Key? key,
    required String title,
    VoidCallback? onPressed,
    bool? isLoading,
  }) {
    return RankaiElevatedButton._(
      key: key,
      title: title,
      onPressed: onPressed,
      isLoading: isLoading ?? false,
    );
  }

  const RankaiElevatedButton._({
    Key? key,
    required this.title,
    this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ButtonStyle(
          textStyle: MaterialStatePropertyAll<TextStyle?>(
            RankaiTextStyles.pRegularBold,
          ),
          elevation: const MaterialStatePropertyAll<double?>(0.0),
          shape: const MaterialStatePropertyAll<OutlinedBorder?>(
            StadiumBorder(
              side: BorderSide(
                color: Colors.transparent,
              ),
            ),
          ),
          backgroundColor: onPressed != null
              ? MaterialStatePropertyAll<Color?>(RankaiPalette.darkGrey)
              : MaterialStatePropertyAll<Color?>(RankaiPalette.midGrey),
          foregroundColor: onPressed != null
              ? MaterialStateProperty.all(Colors.white)
              : null,
        ),
        child: isLoading
            ? const CircularProgressIndicator(color: Colors.white)
            : Text(
                title,
                textAlign: TextAlign.center,
              ),
      ),
    );
  }
}
