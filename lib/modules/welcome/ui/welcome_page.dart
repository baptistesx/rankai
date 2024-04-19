import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
    path.moveTo(0, height); // Bas gauche
    path.lineTo(width, height); // Bas droit
    path.lineTo(width, height - 200); // Haut droit (angle droit ici)
    path.close(); // Reviens au point de départ pour fermer le chemin

    final Paint paint = Paint()
      ..color = RankaiPalette.mainBlue; // Définir la couleur du triangle
    canvas.drawPath(path, paint); // Dessiner le triangle sur le canevas
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
                  'RankAI',
                  style: RankaiTextStyles.heading1,
                ),
                sizedBoxH12,
                Text(
                  S.of(context).rankaiSlogan,
                  style: RankaiTextStyles.pMediumRegular,
                ),
                sizedBoxH64,
                const Text(
                  'Get any kind of ranking as the best movies of 2023, the best books for entrepreneurs in few seconds thanks to Chat GPT 4.',
                ),
                const Spacer(),
                Align(
                  alignment: Alignment.centerRight,
                  child: NextButton(
                    onPressed: () => const SearchRoute().go(context),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
