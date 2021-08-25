import 'dart:convert';

import 'package:news_app/models/article.dart';
import 'package:http/http.dart' as http;

class News {
  List<Article> newsList = [];

  Future<void> getNewsData() async {
    String baseURl =
        'https://newsapi.org/v2/top-headlines?country=eg&category=business&apiKey=f9bf3c2475a64313bb89cc9d9e71baf5';
    try {
      var response = await http.get(baseURl);
      var jsonData = jsonDecode(response.body);

      if (jsonData['status'] == "ok") {
        jsonData["articles"].forEach((element) {
          if (element['urlToImage'] != null && element['description'] != null) {
            Article article = Article(
                title: element['title'],
                author: element['author'],
                description: element['description'],
                urlToImage: element['urlToImage'],
                content: element["content"],
                url: element['url']);
            newsList.add(article);
          }
        });
      }
      if (jsonData['status'] == 'ok') {
        // var result = jsonData['articles'] as List;
        // newsList = result.map((e) {
        //   if (e['urlToImage'] != null &&
        //       e['description'] != null &&
        //       e['title'] != null) {
        //     return Article.fromJson(e);
        //   }
        // }).toList();
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> getNewsDataCat(String category) async {
    String cat = category.toLowerCase();
    String baseURl =
        'https://newsapi.org/v2/top-headlines?country=eg&category=$category&apiKey=f9bf3c2475a64313bb89cc9d9e71baf5';
    try {
      var response = await http.get(baseURl);
      var jsonData = jsonDecode(response.body);

      if (jsonData['status'] == "ok") {
        jsonData["articles"].forEach((element) {
          if (element['urlToImage'] != null && element['description'] != null) {
            Article article = Article(
                title: element['title'],
                author: element['author'],
                description: element['description'],
                urlToImage: element['urlToImage'],
                content: element["content"],
                url: element['url']);
            newsList.add(article);
          }
        });
      }
      if (jsonData['status'] == 'ok') {
        // var result = jsonData['articles'] as List;
        // newsList = result.map((e) {
        //   if (e['urlToImage'] != null &&
        //       e['description'] != null &&
        //       e['title'] != null) {
        //     return Article.fromJson(e);
        //   }
        // }).toList();
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
