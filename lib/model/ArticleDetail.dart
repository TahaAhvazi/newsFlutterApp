class ArticleDetail {
  final String title;
  final int id;
  final String description;
  final String date;
  final String category;

  ArticleDetail({
    required this.title,
    required this.id,
    required this.description,
    required this.date,
    required this.category,
  });

  factory ArticleDetail.fromJson(Map<String, dynamic> json) {
    return ArticleDetail(
        title: json['title'],
        id: json['id'],
        description: json['description'],
        date: json['date'],
        category: json['category']);
  }
}
