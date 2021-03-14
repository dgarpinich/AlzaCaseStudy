import 'package:alza_case_study/services/api_service.dart';
import 'package:alza_case_study/viewmodels/category_view_model.dart';
import 'package:alza_case_study/viewmodels/product_view_model.dart';
import 'package:flutter/material.dart';

class CategoryDetailViewModel extends ChangeNotifier {
  final CategoryViewModel currentCategory;
  bool isBusy = false;
  List<CategoryViewModel> subCategories = [];
  List<ProductViewModel> products = [];

  CategoryDetailViewModel(this.currentCategory) {
    _categoryDetail();
  }

  void _categoryDetail() async {
    this.isBusy = true;
    final Map<String, List> result =
        await ApiService().getCategoryContent(this.currentCategory.dataUrl);
    this.subCategories = result['categories']
        .map((c) => CategoryViewModel(category: c))
        .toList();
    this.products =
        result['products'].map((p) => ProductViewModel(product: p)).toList();
    this.isBusy = false;
    notifyListeners();
  }
}
