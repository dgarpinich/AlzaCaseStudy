import 'dart:convert';

import 'package:alza_case_study/models/product.dart';
import 'package:alza_case_study/models/product_full.dart';
import 'package:http/http.dart' as http;
import 'package:alza_case_study/models/section.dart';
import 'package:alza_case_study/models/category.dart';

class ApiService {
  Future<List<Section>> getSections() async {
    final url = 'https://www.alza.cz/api/catalog/v1/homePage/userNavigation';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final Iterable jsonSections = json['sections'];
      return jsonSections.map((section) => Section.fromJson(section)).toList();
    } else {
      throw Exception("Data url not available");
    }
  }

  Future<List<Category>> getCategories(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List<Category> _categories = [];
      final json = jsonDecode(response.body);
      final Iterable values = json['value'];
      final Iterable jsonCategories =
          values.where((e) => e['itemType'] == 'categories').toList();
      for (var jCat in jsonCategories) {
        for (var jsonCategory in jCat['categories']['value']) {
          if (jsonCategory != null &&
              jsonCategory['self']['appLink'] == "catalogLocalTitlePage") {
            Category _category = Category.fromJson(jsonCategory);
            _categories.add(_category);
          }
        }
      }
      return _categories;
    } else {
      throw Exception("Data url not available");
    }
  }

  Future<Map<String, List<dynamic>>> getCategoryContent(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      Map<String, List> output = {
        'categories': [],
        'products': [],
      };
      final json = jsonDecode(response.body);
      final Iterable values = json['value'];

      final Iterable jsonCategories =
          values.where((e) => e['itemType'] == 'categories').toList();
      final Iterable jsonProducts =
          values.where((e) => e['itemType'] == 'products').toList();

      for (var jCat in jsonCategories) {
        for (var jsonCategory in jCat['categories']['value']) {
          if (jsonCategory != null &&
              jsonCategory['self']['appLink'] == "catalogLocalTitlePage") {
            Category _category = Category.fromJson(jsonCategory);
            output['categories'].add(_category);
          }
        }
      }

      for (var jProd in jsonProducts) {
        final Iterable jsonProductsValue = jProd['commodities']['value'];
        if (jsonProductsValue != null) {
          output['products'].addAll(
              jsonProductsValue.map((p) => Product.fromJson(p)).toList());
        }
      }

      return output;
    } else {
      throw Exception("Data url not available");
    }
  }

  Future<ProductFull> getProductFull(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return ProductFull.fromJson(json['data']);
    } else {
      throw Exception("Data url not available");
    }
  }
}
