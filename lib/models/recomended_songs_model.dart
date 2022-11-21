class RecommendeSongsModel {
  final String name;
  final String artist;
  final String url;

  RecommendeSongsModel(
      {required this.name, required this.artist, required this.url});

  factory RecommendeSongsModel.fromJson(Map<String, dynamic> data) {
    return RecommendeSongsModel(
      name: data['name'],
      artist: data['artist'],
      url: data['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'artist': artist,
      'url': url,
    };
  }
}
