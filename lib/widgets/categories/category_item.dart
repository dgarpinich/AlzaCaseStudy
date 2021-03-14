import 'package:alza_case_study/screens/category_screen.dart';
import 'package:alza_case_study/utils/style.dart';
import 'package:alza_case_study/viewmodels/category_view_model.dart';
import 'package:flutter/material.dart';

class Categoryitem extends StatelessWidget {
  final CategoryViewModel category;
  const Categoryitem({@required this.category});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => CategoryScreen(category: category))),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(mainBorderRadius),
            boxShadow: [categoryItemBoxShadow]),
        child: Row(
          children: [
            Container(
              height: 30,
              width: 30,
              child: Image.network(category.imgUrl),
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  category.name,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: mainFontSize,
                    color: mainTextColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
