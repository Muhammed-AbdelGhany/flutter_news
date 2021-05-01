import 'package:flutter/material.dart';
import 'package:news_app/models/category.dart';
import 'package:news_app/services/news.dart';
import 'package:news_app/widgets/category_card.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Category category = new Category();
  List<Category> categories = [];
  News news = News();

  getnews() async {
    await news.getNewsData();
  }

  @override
  void initState() {
    getnews();
    categories = category.getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: Container(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 80,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: categories.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (ctx, i) {
                      return CategoryCard(
                          imageUrl: categories[i].categoryImageUrl,
                          title: categories[i].categoryName);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
