import 'package:alza_case_study/utils/style.dart';
import 'package:alza_case_study/viewmodels/category_view_model.dart';
import 'package:alza_case_study/widgets/categories/category_item.dart';
import 'package:flutter/material.dart';

class CategoriesSliverGrid extends StatelessWidget {
  final List<CategoryViewModel> categories;
  const CategoriesSliverGrid({@required this.categories});

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: mediumSpacer,
        crossAxisSpacing: mediumSpacer,
        childAspectRatio: (MediaQuery.of(context).size.width / 2) / 55,
      ),
      delegate: SliverChildListDelegate(
        categories.map((category) => Categoryitem(category: category)).toList(),
      ),
    );
  }
}
