import 'dart:convert';

List<Article> myArticles(String str) =>
    List<Article>.from(json.decode(str).map((x) => Article.fromMap(x)));

class Article {
  final String title;
  final int id;
  final String description;
  final String date;
  final String category;

  Article({
    required this.title,
    required this.id,
    required this.description,
    required this.date,
    required this.category,
  });

  factory Article.fromMap(Map<String, dynamic> json) {
    return Article(
        title: json['title'],
        id: json['id'],
        description: json['description'],
        date: json['date'],
        category: json['category']);
  }
}
