class MovieEntity {
  final int movieId;
  final String movieImg;
  final String movieName;
  final String movieReleaseDate;
  final double movieVoteAverage;
  final int movieVoteCount;

  MovieEntity({
    required this.movieId,
    required this.movieImg,
    required this.movieName,
    required this.movieReleaseDate,
    required this.movieVoteAverage,
    required this.movieVoteCount,
  });
}
