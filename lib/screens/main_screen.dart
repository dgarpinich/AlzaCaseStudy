import 'package:alza_case_study/utils/style.dart';
import 'package:alza_case_study/viewmodels/catalog_view_model.dart';
import 'package:alza_case_study/widgets/categories/categories_sliver_grid.dart';
import 'package:alza_case_study/widgets/main/custom_appbar.dart';
import 'package:alza_case_study/widgets/sections/sections_row.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var model = Provider.of<CatalogViewModel>(context);
    if (model.isBusy) {
      return Container(
        color: Colors.white,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else if (model.sections.length == 0) {
      return Container(
        color: Colors.white,
        child: Center(
          child: Text("No data"),
        ),
      );
    } else {
      return Scaffold(
        appBar: CustomAppBar(),
        body: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  SectionsRow(sections: model.sections),
                  SizedBox(height: mainSpacer),
                ],
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: mainSpacer),
              sliver: CategoriesSliverGrid(
                categories: model.currenSection.categories,
              ),
            ),
          ],
        ),
      );
    }
  }
}
