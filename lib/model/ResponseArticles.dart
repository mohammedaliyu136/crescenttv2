import 'Article.dart';

class ResponseArticles{
  int status;
  int totalResults;
  List<Article> articles;
  String error;

  ResponseArticles(this.status, this.totalResults, this.articles);

}