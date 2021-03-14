import 'package:alza_case_study/models/product_full.dart';
import 'package:alza_case_study/services/api_service.dart';
import 'package:alza_case_study/viewmodels/product_full_view_model.dart';
import 'package:flutter/material.dart';

class ProductDetailViewModel extends ChangeNotifier {
  final String productDataUrl;

  bool isBusy = false;
  ProductFullViewModel product;

  ProductDetailViewModel(this.productDataUrl) {
    _productDetail();
  }

  void _productDetail() async {
    this.isBusy = true;
    final ProductFull productFull =
        await ApiService().getProductFull(this.productDataUrl);
    this.product = ProductFullViewModel(product: productFull);
    this.isBusy = false;
    notifyListeners();
  }
}
