import 'package:alza_case_study/screens/product_screen.dart';
import 'package:alza_case_study/utils/style.dart';
import 'package:alza_case_study/viewmodels/product_view_model.dart';
import 'package:alza_case_study/widgets/products/product_rating_stars.dart';
import 'package:alza_case_study/widgets/products/product_sale_badge.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final ProductViewModel product;
  const ProductItem({@required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              ProductScreen(productDataUrl: product.detailUrl))),
      child: Container(
        padding: EdgeInsets.all(mediumSpacer),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(mainBorderRadius),
            boxShadow: [categoryItemBoxShadow]),
        child: Column(
          children: [
            Stack(
              children: [
                Image.network(
                  product.imgUrl,
                  height: 150,
                ),
                if (product.discount != null)
                  Positioned(
                    top: 0,
                    left: 0,
                    child: ProductSaleBadge(
                      saleValue: product.discount,
                    ),
                  ),
              ],
            ),
            SizedBox(height: mediumSpacer),
            ProductRatingStars(rating: product.ratingStars),
            SizedBox(height: mediumSpacer),
            Container(
              height: 30,
              child: Text(
                product.name,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: mainTextColor,
                  fontSize: mainFontSize,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: mediumSpacer),
            Container(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  if (product.cPrice != null)
                    Container(
                      margin: EdgeInsets.only(right: mediumSpacer),
                      child: Text(
                        product.cPrice,
                        style: TextStyle(
                          color: lightTextColor,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ),
                  Text(
                    product.price,
                    style: TextStyle(
                      color: priceColor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: mediumSpacer),
            if (product.availability != null)
              Text(
                product.availability,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: inStockColor,
                  fontSize: mainFontSize,
                ),
              )
          ],
        ),
      ),
    );
  }
}
