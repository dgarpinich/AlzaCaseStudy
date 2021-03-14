import 'package:alza_case_study/models/product.dart';
import 'package:flutter/material.dart';

class ProductViewModel {
  final Product product;

  ProductViewModel({@required this.product});

  String get name => this.product.name;
  String get imgUrl => this.product.imgUrl;
  String get price => this.product.price;
  String get cPrice => this.product.cPrice;
  String get discount => this.product.discount;
  String get availability => this.product.availability;
  double get ratingStars => this.product.ratingStars;
  String get detailUrl => this.product.detailUrl;
}
