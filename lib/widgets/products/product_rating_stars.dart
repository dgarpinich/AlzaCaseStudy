import 'package:alza_case_study/utils/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductRatingStars extends StatelessWidget {
  final double rating;
  final int maxRating = 5;
  const ProductRatingStars({this.rating = 0});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          for (var i = 0; i < maxRating; i++)
            Container(
              margin: EdgeInsets.symmetric(horizontal: mediumSpacer / 2),
              child: Icon(
                (i + 1 <= this.rating.floor())
                    ? CupertinoIcons.star_fill
                    : (i + 1) - this.rating < 1
                        ? CupertinoIcons.star_lefthalf_fill
                        : CupertinoIcons.star,
                size: 12,
                color: this.rating == 0 ? Colors.grey[400] : Colors.yellow[700],
              ),
            ),
        ],
      ),
    );
  }
}
