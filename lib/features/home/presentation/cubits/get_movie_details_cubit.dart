import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/home/data/models/movie_model.dart';
import 'package:movies_app/features/home/domain/use_cases/get_movie_details_use_case.dart';

part 'get_movie_details_state.dart';

class GetMovieDetailsCubit extends Cubit<GetMovieDetailsState> {
  GetMovieDetailsCubit(this.getMovieDetailsUseCase)
    : super(GetMovieDetailsInitial());

  final GetMovieDetailsUseCase getMovieDetailsUseCase;

  Future<void> getMovieDetails({required int movieId}) async {
    emit(GetMovieDetailsLoading());
    final result = await getMovieDetailsUseCase.call(movieId: movieId);
    result.fold(
      (failure) =>
          emit(GetMovieDetailsError(errorMessage: failure.errorMessage)),
      (movie) => emit(GetMovieDetailsLoaded(movieModel: movie)),
    );
  }
}
