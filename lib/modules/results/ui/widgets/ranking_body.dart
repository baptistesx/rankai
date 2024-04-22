import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rankai/core/providers/models/entity.dart';
import 'package:rankai/core/providers/models/ranking.dart';
import 'package:rankai/core/router/routes.dart';
import 'package:rankai/core/theme/extensions/text_extensions.dart';
import 'package:rankai/core/widgets/app_sizes.dart';
import 'package:rankai/core/widgets/rankai_elevated_button.dart';
import 'package:rankai/generated/l10n.dart';
import 'package:rankai/modules/results/ui/widgets/entity_card.dart';

class RankingBody extends StatelessWidget {
  final Ranking ranking;

  const RankingBody({
    super.key,
    required this.ranking,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SvgPicture.asset(
                'assets/images/logo.svg',
                width: 40,
              ),
              sizedBoxH16,
              Text(
                S.of(context).resultPageTitle,
                style: RankaiTextStyles.heading3,
              ),
              sizedBoxH24,
              Text(
                ranking.title,
                style: RankaiTextStyles.pRegularSemiBold,
              ),
            ],
          ),
        ),
        sizedBoxH24,
        CarouselSlider(
          options: CarouselOptions(
            enlargeFactor: 0.2,
            enableInfiniteScroll: false,
            autoPlay: false,
            height: 480,
            enlargeCenterPage: true,
          ),
          items: ranking.entities
              .asMap()
              .entries
              .map(
                (MapEntry<int, Entity> item) =>
                    EntityCard(index: item.key, entity: item.value),
              )
              .toList(),
        ),
        const Spacer(),
        Center(
          child: RankaiElevatedButton.darkGrey(
            title: S.of(context).resultPageOtherRankingButton,
            onPressed: () {
              const SearchRoute().go(context);
            },
          ),
        ),
        // Center(
        //   child: RankaiTextButton.darkGrey(
        //     title: 'See history',
        //     onPressed: () {},
        //   ),
        // ),
      ],
    );
  }
}
