import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failures.dart';
import 'package:movies_app/features/home/data/models/movie_model.dart';
import 'package:movies_app/features/home/domain/repos/home_repo.dart';

class GetMovieDetailsUseCase {
  final HomeRepo homeRepo;
  GetMovieDetailsUseCase({required this.homeRepo});

  Future<Either<Failures, MovieModel>> call({required int movieId}) async =>
      await homeRepo.getMovieDetails(movieId: movieId);
}
