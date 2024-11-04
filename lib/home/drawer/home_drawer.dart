import 'package:flutter/material.dart';
import 'package:news_app/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeDrawer extends StatelessWidget {
  static const int categories = 1;
  static const int settings = 2;
  Function onSideMenuItemClick;
  HomeDrawer({required this.onSideMenuItemClick});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height*0.15,
          child: Center(
            child: Text(AppLocalizations.of(context)!.drawer_title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: 24
              ),
            ),
          ),
          color: AppColors.primaryLightColor,
        ),

        Padding(
          padding: const EdgeInsets.all(10),
          child: InkWell(
            onTap: (){
              onSideMenuItemClick(categories);
            },
            child: Row(
              children: [
                Icon(Icons.view_list_rounded, size: 35,),
                SizedBox(width: MediaQuery.of(context).size.width*0.03,),
                Text(AppLocalizations.of(context)!.categories,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 24,
                      color: AppColors.blackColor
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: InkWell(
            onTap: (){
              onSideMenuItemClick(settings);
            },
            child: Row(
              children: [
                Icon(Icons.settings, size: 35,),
                SizedBox(width: MediaQuery.of(context).size.width*0.03,),
                Text(AppLocalizations.of(context)!.settings,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 24,
                      color: AppColors.blackColor
                  ),)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
