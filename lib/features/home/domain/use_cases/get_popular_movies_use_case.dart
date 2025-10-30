import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failures.dart';
import 'package:movies_app/features/home/domain/entities/movie_entity.dart';
import 'package:movies_app/features/home/domain/repos/home_repo.dart';

class GetPopularMoviesUseCase {
  final HomeRepo homeRepo;
  GetPopularMoviesUseCase({required this.homeRepo});
  Future<Either<Failures, List<MovieEntity>>> call() async =>
      await homeRepo.getPopularMovies();
}
