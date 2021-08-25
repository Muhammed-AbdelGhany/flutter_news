import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/screens/articles.dart';

class NewsCard extends StatelessWidget {
  final title;
  final imageUrl;
  final description;
  final linkUrl;
  final author;

  NewsCard(
      {this.title, this.author, this.description, this.imageUrl, this.linkUrl});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (ctx) => ArticleScreen(
                      url: linkUrl,
                    )));
      },
      child: Container(
        padding: EdgeInsets.only(bottom: 12),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: CachedNetworkImage(
                errorWidget: (context, url, error) => Icon(Icons.error),
                imageUrl: imageUrl,
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 8),
            Container(
                alignment: Alignment.centerRight,
                child: Text(
                  title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.right,
                )),
            SizedBox(height: 8),
            Container(
              child: Text(
                description,
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
            ),
            SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
