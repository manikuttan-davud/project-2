class BrowseSongsModel {
  final String name;
  final String category;
  final String url;

  BrowseSongsModel(
      {required this.name, required this.category, required this.url});

  factory BrowseSongsModel.fromJson(Map<String, dynamic> data) {
    return BrowseSongsModel(
      name: data['name'],
      category: data['category'],
      url: data['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'category': category,
      'url': url,
    };
  }
}
