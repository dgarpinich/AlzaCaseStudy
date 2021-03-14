import 'package:alza_case_study/utils/helpers.dart';
import 'package:flutter/material.dart';

const double mainSpacer = 15;
const double mediumSpacer = 10;

const double mainBorderRadius = 4;

const Color mainTextColor = Colors.black;
final Color lightTextColor = HexColor('#535252');
final Color priceColor = Colors.red;
final Color inStockColor = Colors.green[900];

const double mainFontSize = 12;
const double titleFontSize = 18;
final BoxShadow sectionItemBoxShadow = BoxShadow(
  color: Colors.black.withOpacity(.2),
  blurRadius: 10,
);
final BoxShadow categoryItemBoxShadow = BoxShadow(
  color: Colors.black.withOpacity(.15),
  offset: Offset(0, 1),
  blurRadius: 4,
);

LinearGradient headerBg(
    {@required String startColor, @required String endColor}) {
  return LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [HexColor(endColor), HexColor(startColor)],
  );
}

LinearGradient sectionBg(
    {@required String startColor, @required String endColor}) {
  return LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [HexColor(startColor), HexColor(endColor)],
  );
}
