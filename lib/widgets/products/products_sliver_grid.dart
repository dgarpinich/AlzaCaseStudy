import 'package:alza_case_study/utils/style.dart';
import 'package:alza_case_study/viewmodels/product_view_model.dart';
import 'package:alza_case_study/widgets/products/product_item.dart';
import 'package:flutter/material.dart';

class ProductsSliverGrid extends StatelessWidget {
  final List<ProductViewModel> products;

  const ProductsSliverGrid({@required this.products});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: mediumSpacer,
        crossAxisSpacing: mediumSpacer,
        childAspectRatio: (screenSize.width / 2) / 340,
      ),
      delegate: SliverChildListDelegate(
        products.map((product) => ProductItem(product: product)).toList(),
      ),
    );
  }
}
