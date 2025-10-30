import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failures.dart';
import 'package:movies_app/features/home/data/models/movie_model.dart';
import 'package:movies_app/features/home/domain/entities/movie_entity.dart';

abstract class HomeRepo {
  Future<Either<Failures, List<MovieEntity>>> getPopularMovies();
  Future<Either<Failures, MovieModel>> getMovieDetails({required int movieId});
}
