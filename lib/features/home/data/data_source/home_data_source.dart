import 'package:movies_app/core/constants/api_constants.dart';
import 'package:movies_app/core/services/api_service.dart';
import 'package:movies_app/features/home/data/models/movie_model.dart';
import 'package:movies_app/features/home/domain/entities/movie_entity.dart';

abstract class HomeDataSource {
  Future<List<MovieEntity>> getPopularMovies({required int page});
  Future<MovieModel> getMovieDetails({required int movieId});
}

class HomeDataSourceImpl implements HomeDataSource {
  final ApiService apiService;
  HomeDataSourceImpl({required this.apiService});
  @override
  Future<List<MovieEntity>> getPopularMovies({required int page}) async {
    final res = await apiService.getRequest(
      endpoint: '${ApiConstants.popularMoviesEndpoint}?page=$page',
    );
    final List<dynamic> jsonData = res.data['results'];
    final List<MovieEntity> movies = jsonData
        .map((e) => MovieModel.fromJson(e))
        .toList();
    return movies;
  }

  @override
  Future<MovieModel> getMovieDetails({required int movieId}) async {
    final res = await apiService.getRequest(
      endpoint: movieId.toString(),
    );
    return MovieModel.fromJson(res.data);
  }
}
