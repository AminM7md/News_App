import 'package:flutter/material.dart';
import 'package:news_app/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Category{
  String id;
  String imagePath;
  String tittle;
  Color color;

  Category({required this.id, required this.imagePath, required this.tittle,
    required this.color,});

  static List<Category> getCategories(BuildContext context){
    return [
      Category(id: "sports", imagePath: "assets/images/sports.png",
          tittle: AppLocalizations.of(context)!.sports, color: AppColors.redColor
      ),
      Category(id: "general", imagePath: "assets/images/general.png",
          tittle: AppLocalizations.of(context)!.general, color: AppColors.darkBlueColor
      ),
      Category(id: "health", imagePath: "assets/images/health.png",
          tittle: AppLocalizations.of(context)!.health, color: AppColors.pinkColor
      ),
      Category(id: "business", imagePath: "assets/images/business.png",
          tittle: AppLocalizations.of(context)!.business, color: AppColors.brownColor
      ),
      Category(id: "entertainment", imagePath: "assets/images/entertainment.png",
          tittle: AppLocalizations.of(context)!.entertainment, color: AppColors.blueColor
      ),
      Category(id: "science", imagePath: "assets/images/science.png",
          tittle: AppLocalizations.of(context)!.science, color: AppColors.yellowColor
      ),
    ];
  }
}