import 'package:alza_case_study/models/product_full.dart';
import 'package:flutter/material.dart';

class ProductFullViewModel {
  final ProductFull product;

  ProductFullViewModel({@required this.product});

  String get name => this.product.name;
  String get spec => this.product.spec;
  List<String> get imgsUrls => this.product.imgsUrls;
  String get price => this.product.price;
  String get cPrice => this.product.cPrice;
  String get priceWithoutVat => this.product.priceWithoutVat;
  String get salePercentage => this.product.salePercentage;
  String get availability => this.product.availability;
  String get availPostfix => this.product.availPostfix;
  double get rating => this.product.rating;
}
