import 'dart:convert';

import 'package:news_app/models/article.dart';
import 'package:http/http.dart' as http;

class News {
  List<Article> newsList = [];

  Future<void> getNewsData() async {
    String baseURl =
        'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=f9bf3c2475a64313bb89cc9d9e71baf5';
    try {
      var response = await http.get(baseURl);
      var jsonData = jsonDecode(response.body);
      print('asdasdsdaasd');

      Article article = Article.fromJson(jsonData);
      newsList.add(article);
      print(newsList);
    } catch (e) {
      print(e.toString());
    }
  }
}
