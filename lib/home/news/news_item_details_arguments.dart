import 'package:news_app/model/NewsResponse.dart';

class NewsItemDetailsArguments {
  String title;
  String imagePath;
  String auther;
  String date;
  String content;
  String description;
  String url;
  final News news;

  NewsItemDetailsArguments({required this.title, required this.imagePath
    ,required this.auther, required this.date, required this.news,
  required this.content, required this.description, required this.url});
}