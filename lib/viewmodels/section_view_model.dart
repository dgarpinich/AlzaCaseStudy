import 'package:alza_case_study/models/section.dart';
import 'package:alza_case_study/viewmodels/category_view_model.dart';

class SectionViewModel {
  final Section section;

  List<CategoryViewModel> categories = [];
  bool isSelected = false;

  SectionViewModel({this.section});

  String get name => this.section.name;
  String get iconUrl => this.section.iconUrl;
  String get iconSelectedUrl => this.section.iconSelectedUrl;
  String get logoUrl => this.section.logoUrl;
  String get colorStart => this.section.colorStart;
  String get colorEnd => this.section.colorEnd;
  String get categoriesUrl => this.section.categoriesUrl;
}
