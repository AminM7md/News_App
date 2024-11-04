import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/app_colors.dart';
import 'package:news_app/home/news/news_item.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/model/api_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomSearchDelegate extends SearchDelegate<NewsResponse>{
  List<News> newsList = [];

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      inputDecorationTheme: InputDecorationTheme(
        hintStyle:
        Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Colors.black),
        border: InputBorder.none,
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        icon: Icon(Icons.close, color: AppColors.primaryLightColor, size: 35,),
        onPressed: () {
          query = '';
          // When pressed here the query will be cleared from the search bar.
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
          icon: const Icon(Icons.arrow_back, size: 35, color: AppColors.primaryLightColor,),
          onPressed: () {
            Navigator.of(context).pop();
          },
            // Exit from the search screen.
        );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isNotEmpty) {
      return FutureBuilder(
        future: ApiManager.searchNews(query),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            newsList = snapshot.data!;
            return newsList.isEmpty
                ? Center(
              child: Text(AppLocalizations.of(context)!.no_results_found),
            )
                :
            ListView.builder(
              itemBuilder: (context, index){
                return NewsItem(news: newsList[index]);
                },
              itemCount: newsList.length,
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryLightColor,
              ),
            );
          }
        },
      );
    } else {
      return Center(
        child: Text(AppLocalizations.of(context)!.enter_search_query,
        style: TextStyle(
          fontSize: 20,
        ),),
      );
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return FutureBuilder(
      future: ApiManager.searchNews(query),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          newsList = snapshot.data!;
          return ListView.builder(
            itemBuilder: (context, index){
              return NewsItem(news: newsList[index]);
            },
            itemCount: newsList.length,
          );
        }
        else {
          return Center(
            child:
            Text(AppLocalizations.of(context)!.search_for_news,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: 20
            ),
            ),
          );
        }
      },
    );
  }
}