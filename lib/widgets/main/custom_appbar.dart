import 'package:alza_case_study/utils/style.dart';
import 'package:alza_case_study/viewmodels/catalog_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final bool withBackButton;

  const CustomAppBar({this.height = 65, this.withBackButton = false});

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 45,
        left: mainSpacer,
        right: mainSpacer,
        bottom: mainSpacer,
      ),
      decoration: BoxDecoration(
        gradient: headerBg(
          startColor:
              context.watch<CatalogViewModel>().currenSection.colorStart,
          endColor: context.watch<CatalogViewModel>().currenSection.colorEnd,
        ),
      ),
      child: Column(
        children: [
          Container(
            child: Row(
              children: [
                if (withBackButton)
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      margin: EdgeInsets.only(right: mediumSpacer),
                      child: Icon(
                        CupertinoIcons.left_chevron,
                        color: Colors.white,
                      ),
                    ),
                  ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Image.network(
                      context.watch<CatalogViewModel>().currenSection.logoUrl,
                      height: 45,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
