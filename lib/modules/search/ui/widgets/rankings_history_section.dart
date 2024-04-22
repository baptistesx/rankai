import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:rankai/core/providers/models/ranking.dart';
import 'package:rankai/core/router/routes.dart';
import 'package:rankai/core/theme/extensions/text_extensions.dart';
import 'package:rankai/core/theme/rankai_palette.dart';
import 'package:rankai/core/widgets/app_sizes.dart';
import 'package:rankai/generated/l10n.dart';

class RankingsHistorySection extends StatelessWidget {
  final List<Ranking> rankings;

  const RankingsHistorySection({
    super.key,
    required this.rankings,
  });

  @override
  Widget build(BuildContext context) {
    return rankings.isEmpty
        ? const SizedBox()
        : Card(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 16, 12, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      text: S.of(context).lastRankingsSectionTitlePartOne,
                      style: RankaiTextStyles.pLargeSemiBold,
                      children: <InlineSpan>[
                        TextSpan(
                          text: S.of(context).lastRankingsSectionTitlePartTwo,
                          style: RankaiTextStyles.pLargeSemiBold
                              .copyWith(color: RankaiPalette.mainBlue),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  sizedBoxH8,
                  ...rankings
                      .sublist(0, rankings.length > 3 ? 3 : rankings.length)
                      .asMap()
                      .entries
                      .map(
                        (MapEntry<int, Ranking> e) => Column(
                          children: <Widget>[
                            Consumer(
                              builder: (
                                BuildContext context,
                                WidgetRef ref,
                                Widget? child,
                              ) {
                                return ListTile(
                                  visualDensity:
                                      const VisualDensity(vertical: -4),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 4.0,
                                    vertical: 0,
                                  ),
                                  onTap: () {
                                    ResultsRoute(rankingId: e.value.id)
                                        .go(context);
                                  },
                                  title: Text(
                                    e.value.title,
                                    style: RankaiTextStyles.pSmallRegular,
                                  ),
                                  subtitle: Padding(
                                    padding: const EdgeInsets.only(top: 2.0),
                                    child: Text(
                                      DateFormat('d MMM')
                                          .format(e.value.promptDate),
                                      style: RankaiTextStyles.pSmallRegular
                                          .copyWith(
                                        color: RankaiPalette.midGrey,
                                      ),
                                    ),
                                  ),
                                  trailing:
                                      const Icon(Icons.chevron_right_rounded),
                                );
                              },
                            ),
                            if (e.key <
                                rankings
                                        .sublist(
                                          0,
                                          rankings.length > 3
                                              ? 3
                                              : rankings.length,
                                        )
                                        .length -
                                    1)
                              const Divider(),
                          ],
                        ),
                      ),
                  // Align(
                  //   alignment: Alignment.bottomRight,
                  //   child: RankaiTextButton.darkGrey(
                  //     title: 'Voir tout',
                  //     onPressed: () {},
                  //   ),
                  // ),
                ],
              ),
            ),
          );
  }
}
