import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rankai/core/providers/models/entity.dart';
import 'package:rankai/core/theme/extensions/text_extensions.dart';
import 'package:rankai/core/theme/rankai_palette.dart';
import 'package:rankai/core/widgets/app_sizes.dart';
import 'package:rankai/core/widgets/rankai_text_button.dart';
import 'package:rankai/generated/l10n.dart';
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
          padding: const EdgeInsets.only(top: 25.0),
          child: Card(
            color: RankaiPalette.darkGrey,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 16, 16, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: entity.imageUrl != null &&
                              !entity.imageUrl!.contains('example') &&
                              entity.imageUrl!.contains('http')
                          ? Image.network(
                              entity.imageUrl!,
                              width: 100,
                            )
                          : Container(
                              padding: const EdgeInsets.all(8),
                              width: 230,
                              height: 250,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: <Color>[
                                    RankaiPalette.midGrey,
                                    RankaiPalette.mainBlue,
                                  ],
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  entity.name ??
                                      S.of(context).entityCardTitleUnknown,
                                  textAlign: TextAlign.center,
                                  style: RankaiTextStyles.heading3
                                      .copyWith(color: Colors.white),
                                ),
                              ),
                            ),
                    ),
                  ),
                  sizedBoxH12,
                  // Text(
                  //   entity.name ?? 'Unknown',
                  //   style:
                  //       RankaiTextStyles.heading3.copyWith(color: Colors.white),
                  // ),
                  // sizedBoxH8,
                  Text(
                    entity.author ?? S.of(context).entityCardAuthorUnknown,
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
                    entity.description ??
                        S.of(context).entityCardDescriptionUnknown,
                    style: RankaiTextStyles.pSmallRegular.copyWith(
                      color: Colors.white,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  sizedBoxH12,
                  const Spacer(), // This will push everything below it to the bottom
                  if (entity.description != null)
                    Align(
                      alignment: Alignment.centerRight,
                      child: RankaiTextButton.white(
                        title: S.of(context).entityCardSeeMoreButton,
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) => SafeArea(
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(entity.description!),
                              ),
                            ),
                          );
                        },
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
              width: 50,
            ), // Ensure this path and size are correct
          ),
      ],
    );
  }
}
