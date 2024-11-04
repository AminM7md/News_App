import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/model/api_constants.dart';

///class to collect all methods of Api
class ApiManager {
  static Future<SourceResponse?> getSources(String categoryId) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.sourceApiName,
        {
         'apiKey': ApiConstants.apiKey,
         'category': categoryId,
        });
    var response = await http.get(url);
    try{
     var responseBody = response.body;    //-> string
     var json = jsonDecode(responseBody); //-> json
     return SourceResponse.fromJson(json); //-> convert from json object to SourceResponse object
    }
    catch(e){
     throw e;
    }
  }

  static Future<NewsResponse?> getNewsBySourceId(String sourceID) async{
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.newsApiName,
    {
      'apiKey' : ApiConstants.apiKey,
      'sources' : sourceID
    });
    var response = await http.get(url);
    try{
      var responseBody = response.body;     //-> string
      var json = jsonDecode(responseBody);  //-> json
        return NewsResponse.fromJson(json); //-> convert from json object to NewsResponse object
    }
    catch(e){
      throw e;
    }
  }

  static Future<List<News>?> searchNews(String query) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.newsApiName, {
      'apiKey': ApiConstants.apiKey,
      'q': query,
    });
    var response = await http.get(url);
    try {
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return NewsResponse.fromJson(json).articles;
    } catch (e) {
      throw e;
    }
  }

}
