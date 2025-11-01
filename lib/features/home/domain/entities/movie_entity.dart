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

  factory MovieEntity.placeHolder() {
    return MovieEntity(
      movieId: 0,
      movieImg: 'holder holder holder',
      movieName: 'holder holder',
      movieReleaseDate: 'holder ',
      movieVoteAverage: 0.0,
      movieVoteCount: 0,
    );
  }
}
