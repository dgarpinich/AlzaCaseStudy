import 'package:alza_case_study/utils/helpers.dart';
import 'package:alza_case_study/utils/style.dart';
import 'package:alza_case_study/viewmodels/catalog_view_model.dart';
import 'package:alza_case_study/viewmodels/section_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SectionItem extends StatelessWidget {
  final SectionViewModel section;

  const SectionItem({@required this.section});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Provider.of<CatalogViewModel>(context, listen: false)
          .setSelected(section),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 13),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Stack(
                    children: [
                      if (section.isSelected)
                        Positioned(
                          bottom: 0,
                          left: 20,
                          child: RotationTransition(
                            turns: AlwaysStoppedAnimation(45 / 360),
                            child: Container(
                              color: HexColor(section.colorEnd),
                              height: 20,
                              width: 20,
                            ),
                          ),
                        ),
                      Container(
                        height: 60,
                        width: 60,
                        decoration: section.isSelected
                            ? BoxDecoration(
                                gradient: sectionBg(
                                  startColor: section.colorStart,
                                  endColor: section.colorEnd,
                                ),
                                border: Border.all(
                                  color: HexColor(section.colorEnd),
                                ),
                                borderRadius: BorderRadius.circular(30),
                              )
                            : BoxDecoration(
                                border: Border.all(
                                  color: HexColor(section.colorEnd),
                                ),
                                color: Colors.white,
                                boxShadow: [sectionItemBoxShadow],
                                borderRadius: BorderRadius.circular(30),
                              ),
                        child: Center(
                          child: Image.network(
                            section.isSelected
                                ? section.iconSelectedUrl
                                : section.iconUrl,
                            height: 32,
                            width: 32,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: mediumSpacer),
                  Container(
                    width: 60,
                    child: Text(
                      section.name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color:
                            section.isSelected ? mainTextColor : lightTextColor,
                        fontSize: mainFontSize,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
