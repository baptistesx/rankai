import 'package:flutter/material.dart';
import 'package:rankai/core/providers/models/ranking.dart';
import 'package:rankai/core/theme/extensions/text_extensions.dart';
import 'package:rankai/core/theme/rankai_palette.dart';
import 'package:rankai/core/widgets/app_sizes.dart';
import 'package:rankai/core/widgets/rankai_text_button.dart';

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
                      text: 'Your last ',
                      style: RankaiTextStyles.pLargeSemiBold,
                      children: <InlineSpan>[
                        TextSpan(
                          text: 'rankings',
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
                            ListTile(
                              visualDensity: const VisualDensity(vertical: -4),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 4.0,
                                vertical: 0,
                              ),
                              onTap: () {},
                              title: Text(
                                e.value.title,
                                style: RankaiTextStyles.pSmallRegular,
                              ),
                              trailing: const Icon(Icons.chevron_right_rounded),
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
                  Align(
                    alignment: Alignment.bottomRight,
                    child: RankaiTextButton.darkGrey(
                      title: 'Voir tout',
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
