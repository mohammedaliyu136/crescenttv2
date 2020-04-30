import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:dio/dio.dart';
import 'package:crescenttv/model/Article.dart';
import 'package:crescenttv/model/ResponseArticles.dart';

class ApiProvider {
  final Dio _dio = Dio();
  final String _baseUrl =
  //'https://newsapi.org/v2/top-headlines?country=id&apiKey=f641e97acfae42e4ba9329e2314d0e62';
      'https://us-central1-news-api-b3f5b.cloudfunctions.net/webApi/api/v1';

  void printOutError(error, StackTrace stacktrace) {
    print('Exception occured: $error with stacktrace: $stacktrace');
  }

  Future<ResponseArticles> getTopHeadlinesNews() async {
    final response = await http.get(_baseUrl+'/headlines');
    print("0000000000000");
    print("0000000000000");
    print("0000000000000");
    print("0000000000000");
    print(response.statusCode);
    if (response.statusCode == 200) {
      var res = (json.decode(response.body))['articles'];


      for(var i=0; i<res.length; i++){
        String q = res[i]['author'];
        print("+++++++++++++++++++++++++ $q");
      }
      //List<Article> articles = convertJSON(res);
      //print(articles);
    }
    //print(json.decode(response.body)['articles']);


    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON.
      //print(json.decode(response.body) as List);
      var res = (json.decode(response.body)['articles']);
      List<Article> articles = convertJSON(res);
      print("+++++++++++++++++++++++++++");
      print("+++++++++++++++++++++++++++");
      print("+++++++++++++++++++++++++++");
      print(articles);
      /*
      String status = response.body['status'];
      int totalResults= response.body['totalResults'];
      articles:
       */
      //print(ResponseArticles(response.statusCode, articles.length, articles));
      return ResponseArticles(response.statusCode, articles.length, articles);
    } else {
      ResponseArticles(response.statusCode, 0, []);
      // If that call was not successful, throw an error.
      throw Exception('Failed to load restaurants');
    }
  }

  List<Article> convertJSON(res) {
    //var res = (json.decode(response.body)['articles']);
    List<Article> articles = [];
    for(var i=0; i<res.length; i++){

      //var restaurant = Article(id: res[i]['id'], name: res[i]['name'], img_url: res[i]['img_url'], phone_number: res[i]['phone_number'], location: res[i]['location']);
      var article = Article(res[i]['author'], res[i]['title'], res[i]['description'], res[i]['url'], res[i]['urlToImage'], res[i]['publishedAt'], res[i]['content']);
      articles.add(article);
    }

    return articles;
  }
}
