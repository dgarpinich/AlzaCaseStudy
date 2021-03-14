import 'package:alza_case_study/viewmodels/section_view_model.dart';
import 'package:alza_case_study/widgets/sections/section_item.dart';
import 'package:flutter/material.dart';

class SectionsRow extends StatelessWidget {
  final List<SectionViewModel> sections;

  const SectionsRow({@required this.sections});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var section in sections)
            SectionItem(
              section: section,
            ),
        ],
      ),
    );
  }
}
