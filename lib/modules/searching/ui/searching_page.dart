import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rankai/core/providers/models/ranking.dart';
import 'package:rankai/core/providers/ranking_details.dart';
import 'package:rankai/core/router/routes.dart';
import 'package:rankai/core/theme/extensions/text_extensions.dart';
import 'package:rankai/core/theme/rankai_palette.dart';
import 'package:rankai/core/widgets/app_sizes.dart';
import 'package:rankai/core/widgets/toast.dart';
import 'package:rankai/generated/l10n.dart';

class SearchingPage extends ConsumerStatefulWidget {
  final String userPrompt;

  const SearchingPage({super.key, required this.userPrompt});

  @override
  ConsumerState<SearchingPage> createState() => _SearchingPageState();
}

class _SearchingPageState extends ConsumerState<SearchingPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: const Duration(seconds: 2))
        ..repeat();

  @override
  Widget build(BuildContext context) {
    ref.listen(rankingDetailsProvider(userPrompt: widget.userPrompt),
        (AsyncValue<Ranking>? previous, AsyncValue<Ranking> next) async {
      if (next.hasError) {
        showErrorToast(
          context: context,
          title: 'Error',
          text: next.error.toString(),
        );
        const SearchRoute().go(context);
      } else {
        ResultsRoute(userPrompt: widget.userPrompt).go(
          context,
        );
      }
    });

    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: RankaiPalette.mainBlue,
        body: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AnimatedBuilder(
                animation: _controller,
                builder: (_, Widget? child) {
                  return Transform.rotate(
                    angle: _controller.value * 2 * math.pi,
                    child: child,
                  );
                },
                child: SvgPicture.asset(
                  'assets/images/logo.svg',
                  colorFilter:
                      const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
              ),
              sizedBoxH32,
              RichText(
                text: TextSpan(
                  text: S.of(context).searchingPageMessagePartOne,
                  style:
                      RankaiTextStyles.heading3.copyWith(color: Colors.white),
                  children: <InlineSpan>[
                    TextSpan(
                      text: S.of(context).searchingPageMessagePartTwo,
                      style: RankaiTextStyles.heading3
                          .copyWith(color: RankaiPalette.darkGrey),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }
}
