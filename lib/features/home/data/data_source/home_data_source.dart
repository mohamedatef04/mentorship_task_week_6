import 'package:hive/hive.dart';
import 'package:movies_app/core/constants/api_constants.dart';
import 'package:movies_app/core/services/api_service.dart';
import 'package:movies_app/features/home/data/models/movie_hive_model.dart';
import 'package:movies_app/features/home/data/models/movie_model.dart';
import 'package:movies_app/features/home/domain/entities/movie_entity.dart';

abstract class HomeDataSource {
  Future<List<MovieEntity>> getPopularMovies({required int page});
  Future<MovieModel> getMovieDetails({required int movieId});
}

class HomeDataSourceImpl implements HomeDataSource {
  final ApiService apiService;
  final Box<dynamic> moviesBox = Hive.box('moviesBox');

  HomeDataSourceImpl({required this.apiService});

  @override
  Future<List<MovieEntity>> getPopularMovies({int page = 1}) async {
    final cacheKey = 'page_$page';

    final cachedMovies = _getCachedMovies(cacheKey);
    if (cachedMovies.isNotEmpty) {}

    try {
      final res = await apiService.getRequest(
        endpoint: '${ApiConstants.popularMoviesEndpoint}?page=$page',
      );

      final List<dynamic> jsonData = res.data['results'];
      final List<MovieEntity> movies = jsonData
          .map((e) => MovieModel.fromJson(e))
          .toList();

      await _cacheMovies(cacheKey, movies);

      return movies;
    } catch (e) {
      if (cachedMovies.isNotEmpty) {
        return cachedMovies;
      }

      return [];
    }
  }

  Future<void> _cacheMovies(String key, List<MovieEntity> movies) async {
    final movieHiveList = movies
        .map(
          (m) => MovieHiveModel(
            movieId: m.movieId,
            movieImg: m.movieImg,
            movieName: m.movieName,
            movieReleaseDate: m.movieReleaseDate,
            movieVoteAverage: m.movieVoteAverage,
            movieVoteCount: m.movieVoteCount,
          ),
        )
        .toList();

    await moviesBox.put(key, movieHiveList);
  }

  List<MovieEntity> _getCachedMovies(String key) {
    final cached = moviesBox.get(key);
    if (cached == null) return [];

    final movieList = (cached as List)
        .map(
          (e) => e is MovieHiveModel
              ? e
              : MovieHiveModel.fromJson(Map<String, dynamic>.from(e)),
        )
        .toList();

    return movieList
        .map(
          (e) => MovieEntity(
            movieId: e.movieId,
            movieImg: e.movieImg,
            movieName: e.movieName,
            movieReleaseDate: e.movieReleaseDate,
            movieVoteAverage: e.movieVoteAverage,
            movieVoteCount: e.movieVoteCount,
          ),
        )
        .toList();
  }

  @override
  Future<MovieModel> getMovieDetails({required int movieId}) async {
    final res = await apiService.getRequest(endpoint: movieId.toString());
    return MovieModel.fromJson(res.data);
  }
}
