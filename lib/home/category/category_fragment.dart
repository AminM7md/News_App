import 'package:flutter/material.dart';
import 'package:news_app/app_colors.dart';
import 'package:news_app/home/category/category_item.dart';
import 'package:news_app/model/Category.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategoryFragment extends StatelessWidget {
  // var categoriesList = Category.getCategories();
  Function onCategoryItemClick;
  CategoryFragment({required this.onCategoryItemClick});
  @override
  Widget build(BuildContext context) {
    var categoriesList = Category.getCategories(context);
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height*0.02,),
          Text(AppLocalizations.of(context)!.main_line_category,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: AppColors.blackColor
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.03,),
          Expanded(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10
                ),
                itemBuilder: (context, index){
                  return InkWell(
                      onTap: (){
                        onCategoryItemClick(categoriesList[index]);
                      },
                      child: CategoryItem(category: categoriesList[index], index: index));
                },
              itemCount: categoriesList.length,
            ),
          )
        ],
      ),
    );
  }
}
