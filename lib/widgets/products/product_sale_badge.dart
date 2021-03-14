import 'package:alza_case_study/utils/style.dart';
import 'package:flutter/material.dart';

class ProductSaleBadge extends StatelessWidget {
  final String saleValue;

  const ProductSaleBadge({@required this.saleValue});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: Colors.yellow[600],
        borderRadius: BorderRadius.circular(40),
      ),
      child: Center(
          child: Text(
        saleValue,
        style: TextStyle(fontSize: mainFontSize),
      )),
    );
  }
}
