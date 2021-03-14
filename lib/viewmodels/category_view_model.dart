import 'package:alza_case_study/models/category.dart';
import 'package:flutter/material.dart';

class CategoryViewModel {
  final Category category;

  List<Category> subCategories = [];

  CategoryViewModel({@required this.category});

  String get name => this.category.name;
  String get imgUrl => this.category.imgUrl;
  String get dataUrl => this.category.dataUrl;
}
