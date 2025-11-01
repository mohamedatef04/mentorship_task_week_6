import 'package:hive/hive.dart';

part 'movie_hive_model.g.dart';

@HiveType(typeId: 0)
class MovieHiveModel extends HiveObject {
  @HiveField(0)
  int movieId;

  @HiveField(1)
  String movieImg;

  @HiveField(2)
  String movieName;

  @HiveField(3)
  String movieReleaseDate;

  @HiveField(4)
  double movieVoteAverage;

  @HiveField(5)
  int movieVoteCount;

  MovieHiveModel({
    required this.movieId,
    required this.movieImg,
    required this.movieName,
    required this.movieReleaseDate,
    required this.movieVoteAverage,
    required this.movieVoteCount,
  });
  factory MovieHiveModel.fromJson(Map<String, dynamic> json) {
    return MovieHiveModel(
      movieId: json['movieId'],
      movieName: json['movieName'],
      movieImg: json['movieImg'],
      movieReleaseDate: json['movieReleaseDate'],
      movieVoteAverage: (json['movieVoteAverage'] as num).toDouble(),
      movieVoteCount: json['movieVoteCount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'movieId': movieId,
      'movieName': movieName,
      'movieImg': movieImg,
      'movieReleaseDate': movieReleaseDate,
      'movieVoteAverage': movieVoteAverage,
      'movieVoteCount': movieVoteCount,
    };
  }
}
