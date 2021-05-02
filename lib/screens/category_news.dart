import 'package:flutter/material.dart';
import 'package:news_app/models/article.dart';
import 'package:news_app/models/category.dart';
import 'package:news_app/screens/articles.dart';
import 'package:news_app/services/news.dart';
import 'package:news_app/widgets/category_card.dart';
import 'package:news_app/widgets/news_card.dart';

class CategoryScreen extends StatefulWidget {
  final category;
  CategoryScreen({this.category});
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<Article> articles = [];

  bool _isloading = true;

  getnews() async {
    News news = News();
    await news
        .getNewsDataCat(widget.category)
        .then((value) => articles = news.newsList);

    setState(() {
      _isloading = false;
    });
  }

  @override
  void initState() {
    getnews();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.blue),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        brightness: Brightness.light,
        title: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: TextStyle(fontSize: 22),
            children: <TextSpan>[
              TextSpan(
                  text: 'News',
                  style: TextStyle(
                      fontWeight: FontWeight.w500, color: Colors.black)),
              TextSpan(
                  text: 'App',
                  style: TextStyle(
                      fontWeight: FontWeight.w500, color: Colors.blue)),
            ],
          ),
        ),
      ),
      body: _isloading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              padding: EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Colors.blue),
                      child: Text(
                        widget.category,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 24),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      //height: 700,
                      child: ListView.builder(
                          //physics: AlwaysScrollableScrollPhysics(),
                          physics: ClampingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: articles.length,
                          itemBuilder: (ctx, i) {
                            return NewsCard(
                                title: articles[i].title ?? 'no',
                                description: articles[i].description,
                                imageUrl: articles[i].urlToImage,
                                linkUrl: articles[i].url,
                                author: articles[i].author);
                          }),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
