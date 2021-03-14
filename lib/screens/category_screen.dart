import 'package:alza_case_study/utils/style.dart';
import 'package:alza_case_study/viewmodels/category_detail_view_model.dart';
import 'package:alza_case_study/viewmodels/category_view_model.dart';
import 'package:alza_case_study/widgets/categories/categories_sliver_grid.dart';
import 'package:alza_case_study/widgets/main/custom_appbar.dart';
import 'package:alza_case_study/widgets/products/products_sliver_grid.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatelessWidget {
  final CategoryViewModel category;

  const CategoryScreen({@required this.category});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CategoryDetailViewModel>(
      create: (_) => CategoryDetailViewModel(category),
      child: Consumer(builder: (_, CategoryDetailViewModel model, __) {
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
              : model.currentCategory == null
                  ? Container(
                      color: Colors.white,
                      child: Center(
                        child: Text("No data"),
                      ),
                    )
                  : CustomScrollView(
                      slivers: [
                        SliverList(
                          delegate: SliverChildListDelegate(
                            [
                              SizedBox(height: mainSpacer),
                            ],
                          ),
                        ),
                        SliverPadding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: mainSpacer),
                          sliver: CategoriesSliverGrid(
                            categories: model.subCategories,
                          ),
                        ),
                        SliverList(
                          delegate: SliverChildListDelegate(
                            [
                              SizedBox(height: mainSpacer),
                            ],
                          ),
                        ),
                        SliverPadding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: mainSpacer),
                          sliver: ProductsSliverGrid(
                            products: model.products,
                          ),
                        ),
                        SliverList(
                          delegate: SliverChildListDelegate(
                            [
                              SizedBox(height: mainSpacer),
                            ],
                          ),
                        ),
                      ],
                    ),
        );
      }),
    );
  }
}
