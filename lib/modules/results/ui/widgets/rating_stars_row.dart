import 'package:flutter/material.dart';

class RatingStarsRow extends StatelessWidget {
  final double rating;

  const RatingStarsRow({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    final int fullStars = rating.floor();
    final bool halfStar = (rating - fullStars >= 0.5);
    final int emptyStars = 5 - fullStars - (halfStar ? 1 : 0);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ...List.generate(
          fullStars,
          (int index) => const Icon(Icons.star, color: Colors.amber),
        ),
        if (halfStar) const Icon(Icons.star_half, color: Colors.amber),
        ...List.generate(
          emptyStars,
          (int index) => const Icon(Icons.star_border, color: Colors.amber),
        ),
      ],
    );
  }
}
