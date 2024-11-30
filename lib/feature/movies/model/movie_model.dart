class MovieModel {
  final String title, overview, posterPath, releaseDate;
  final double popularity, voteAverage;

  MovieModel({
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
    required this.popularity,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
        title: json["title"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        releaseDate: json["release_date"],
        voteAverage: json["vote_average"],
        popularity: json["popularity"]);
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'overview': overview,
      'poster_path': posterPath,
      'release_date': releaseDate,
      'vote_average': voteAverage,
      'popularity': popularity,
    };
  }
}
