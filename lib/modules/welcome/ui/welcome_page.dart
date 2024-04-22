import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:rankai/core/providers/package_info.dart';
import 'package:rankai/core/router/routes.dart';
import 'package:rankai/core/theme/extensions/text_extensions.dart';
import 'package:rankai/core/theme/rankai_palette.dart';
import 'package:rankai/core/widgets/app_sizes.dart';
import 'package:rankai/core/widgets/next_button.dart';
import 'package:rankai/generated/l10n.dart';

class RightAngledTrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double width = size.width;
    final double height = size.height;

    final Path path = Path();
    path.moveTo(0, height); // bottom left
    path.lineTo(width, height); // bottom right
    path.lineTo(width, height - 200); // top right
    path.close(); // close the path

    final Paint paint = Paint()..color = RankaiPalette.mainBlue;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: CustomPaint(
              painter: RightAngledTrianglePainter(),
              size: const Size(300, 550),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 150, 16, 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SvgPicture.asset(
                  'assets/images/logo.svg',
                ),
                Text(
                  S.of(context).appTitle,
                  style: RankaiTextStyles.heading1,
                ),
                sizedBoxH12,
                Text(
                  S.of(context).rankaiSlogan,
                  style: RankaiTextStyles.pMediumRegular,
                ),
                sizedBoxH64,
                Text(
                  S.of(context).appDescription,
                ),
                const Spacer(),
                Align(
                  alignment: Alignment.centerRight,
                  child: NextButton(
                    onPressed: () => const SearchRoute().go(context),
                  ),
                ),
                Consumer(
                  builder:
                      (BuildContext context, WidgetRef ref, Widget? child) {
                    final PackageInfo packageInfo =
                        ref.read(packageInfoProvider);
                    return Text(
                      'V${packageInfo.version}',
                      style: RankaiTextStyles.pRegularSemiBold.copyWith(
                        color: RankaiPalette.midGrey,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
