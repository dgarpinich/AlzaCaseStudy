import 'package:alza_case_study/services/api_service.dart';
import 'package:alza_case_study/viewmodels/category_view_model.dart';
import 'package:alza_case_study/viewmodels/section_view_model.dart';
import 'package:flutter/material.dart';

class CatalogViewModel extends ChangeNotifier {
  bool isBusy = false;
  List<SectionViewModel> sections = [];

  SectionViewModel get currenSection {
    return this.sections.firstWhere((s) => s.isSelected);
  }

  CatalogViewModel() {
    _sectionsMenu();
  }

  void _sectionsMenu() async {
    this.isBusy = true;
    final result = await ApiService().getSections();
    this.sections = result.map((s) => SectionViewModel(section: s)).toList();
    if (this.sections.isNotEmpty) {
      this.sections.first.isSelected = true;
    }
    await getCategories();

    this.isBusy = false;
    notifyListeners();
  }

  Future<void> getCategories() async {
    for (SectionViewModel section in this.sections) {
      final result = await ApiService().getCategories(section.categoriesUrl);
      section.categories =
          result.map((c) => CategoryViewModel(category: c)).toList();
    }
  }

  void setSelected(SectionViewModel section) {
    this.sections.forEach((s) => s.isSelected = false);
    section.isSelected = true;
    notifyListeners();
  }
}
