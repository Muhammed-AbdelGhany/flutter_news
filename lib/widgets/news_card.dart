import 'package:flutter/material.dart';

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
    return Container(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.network(
              imageUrl,
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 6),
          Container(
            child: Text(title),
          ),
          SizedBox(height: 2),
          Container(
            child: Text(description),
          ),
          SizedBox(height: 2),
          Container(
            child: Text(author),
          ),
        ],
      ),
    );
  }
}
