import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rankai/core/providers/models/entity.dart';
import 'package:rankai/core/providers/models/ranking.dart';
import 'package:rankai/core/providers/ranking_details.dart';
import 'package:rankai/core/router/routes.dart';
import 'package:rankai/core/theme/extensions/text_extensions.dart';
import 'package:rankai/core/theme/rankai_palette.dart';
import 'package:rankai/core/widgets/app_sizes.dart';
import 'package:rankai/core/widgets/rankai_elevated_button.dart';
import 'package:rankai/core/widgets/rankai_text_button.dart';
import 'package:rankai/modules/results/ui/widgets/rating_stars_row.dart';

class EntityCard extends StatelessWidget {
  final Entity entity;
  final int index;

  const EntityCard({
    super.key,
    required this.entity,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 35.0),
          child: Card(
            color: RankaiPalette.darkGrey,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 16, 16, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  if (entity.imageUrl != null &&
                      !entity.imageUrl!.contains('example'))
                    Align(
                      alignment: Alignment.center,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          entity.imageUrl!,
                          width: 100,
                        ),
                      ),
                    ),
                  sizedBoxH12,
                  Text(
                    entity.name ?? 'Unknown',
                    style:
                        RankaiTextStyles.heading3.copyWith(color: Colors.white),
                  ),
                  sizedBoxH8,
                  Text(
                    entity.author ?? 'Unknown',
                    style: RankaiTextStyles.pMediumSemiBold.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  if (entity.rating != null) ...<Widget>[
                    sizedBoxH8,
                    RatingStarsRow(
                      rating: entity.rating!,
                    ),
                  ],
                  sizedBoxH12,
                  Text(
                    entity.description ?? 'Unknown',
                    style: RankaiTextStyles.pSmallRegular.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  sizedBoxH12,
                  const Spacer(), // This will push everything below it to the bottom
                  Align(
                    alignment: Alignment.centerRight,
                    child: RankaiTextButton.white(
                      title: 'See More',
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        if (index == 0 && entity.rating != null)
          Positioned(
            left: 25,
            top: 0, // Adjusted to prevent cropping
            child: SvgPicture.asset(
              'assets/images/crown.svg',
              width: 70,
            ), // Ensure this path and size are correct
          ),
      ],
    );
  }
}

class ResultsPage extends ConsumerWidget {
  final String userPrompt;

  const ResultsPage({super.key, required this.userPrompt});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<Ranking> res =
        ref.watch(rankingDetailsProvider(userPrompt: userPrompt));

    return Scaffold(
      body: SafeArea(
        child: res.when(
          data: (Ranking ranking) => Column(
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
                      'Here it is',
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
              res.when(
                data: (Ranking ranking) => CarouselSlider(
                  options: CarouselOptions(
                    enlargeFactor: 0.2,
                    enableInfiniteScroll: false,
                    autoPlay: false,
                    height: 460,
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
                error: (Object error, StackTrace stackTrace) =>
                    const Text('An error occured'),
                loading: () => const CircularProgressIndicator(),
              ),
              const Spacer(),
              Center(
                child: RankaiElevatedButton.darkGrey(
                  title: 'Get a different ranking',
                  onPressed: () {
                    const SearchRoute().go(context);
                  },
                ),
              ),
              Center(
                child: RankaiTextButton.darkGrey(
                  title: 'See history',
                  onPressed: () {},
                ),
              ),
            ],
          ),
          error: (Object error, StackTrace stackTrace) =>
              const Center(child: Text('An error occured')),
          loading: () => const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
