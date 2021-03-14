import 'package:alza_case_study/utils/style.dart';
import 'package:alza_case_study/viewmodels/product_detail_view_model.dart';
import 'package:alza_case_study/widgets/main/custom_appbar.dart';
import 'package:alza_case_study/widgets/products/product_image_slider.dart';
import 'package:alza_case_study/widgets/products/product_rating_stars.dart';
import 'package:alza_case_study/widgets/products/product_sale_badge.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatelessWidget {
  final String productDataUrl;

  const ProductScreen({@required this.productDataUrl});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProductDetailViewModel>(
      create: (_) => ProductDetailViewModel(productDataUrl),
      child: Consumer(
        builder: (_, ProductDetailViewModel model, __) {
          return Scaffold(
            appBar: CustomAppBar(
              withBackButton: true,
            ),
            body: model.isBusy
                ? Container(
                    color: Colors.white,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : model.product == null
                    ? Container(
                        color: Colors.white,
                        child: Center(
                          child: Text("No data"),
                        ),
                      )
                    : SingleChildScrollView(
                        child: Padding(
                          padding:
                              const EdgeInsets.symmetric(vertical: mainSpacer),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: mainSpacer),
                                child: Text(
                                  model.product.name,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: mainTextColor,
                                    fontSize: titleFontSize,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              SizedBox(height: mainSpacer),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: mainSpacer),
                                child: ProductRatingStars(
                                    rating: model.product.rating),
                              ),
                              SizedBox(height: mainSpacer),
                              Stack(
                                children: [
                                  ProductimageSlider(
                                      images: model.product.imgsUrls),
                                  if (model.product.salePercentage != null)
                                    Positioned(
                                      top: 0,
                                      left: mainSpacer,
                                      child: ProductSaleBadge(
                                        saleValue: model.product.salePercentage,
                                      ),
                                    ),
                                ],
                              ),
                              SizedBox(height: mainSpacer),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: mainSpacer),
                                child: Text(
                                  model.product.spec,
                                ),
                              ),
                              SizedBox(height: mainSpacer),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: mainSpacer),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            model.product.availability,
                                            style: TextStyle(
                                              color: inStockColor,
                                            ),
                                          ),
                                          Text(
                                            model.product.availPostfix,
                                            style: TextStyle(
                                              color: inStockColor,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          if (model.product.cPrice != null)
                                            Text(
                                              model.product.cPrice,
                                              style: TextStyle(
                                                color: lightTextColor,
                                                decoration:
                                                    TextDecoration.lineThrough,
                                              ),
                                            ),
                                          Text(
                                            model.product.price,
                                            style: TextStyle(
                                              color: priceColor,
                                              fontSize: titleFontSize,
                                            ),
                                          ),
                                          if (model.product.priceWithoutVat !=
                                              null)
                                            Text(
                                              "${model.product.priceWithoutVat} bez DPH",
                                              style: TextStyle(
                                                color: lightTextColor,
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
          );
        },
      ),
    );
  }
}
