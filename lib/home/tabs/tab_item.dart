import 'package:flutter/material.dart';
import 'package:news_app/app_colors.dart';
import 'package:news_app/model/SourceResponse.dart';

class TabItem extends StatelessWidget {
  bool isSelectedItem;
  Source source;
  TabItem({required this.isSelectedItem, required this.source});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
          color: isSelectedItem? AppColors.primaryLightColor : Colors.transparent,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: AppColors.primaryLightColor,
          width: 3,
        )
      ),
      child: Text(source.name ?? "",
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
        color: isSelectedItem? AppColors.whiteColor : AppColors.primaryLightColor,
      ),
      ),
    );
  }
}
