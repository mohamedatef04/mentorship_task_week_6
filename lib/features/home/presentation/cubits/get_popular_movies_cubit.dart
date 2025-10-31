import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/home/domain/entities/movie_entity.dart';
import 'package:movies_app/features/home/domain/use_cases/get_popular_movies_use_case.dart';
part 'get_popular_movies_state.dart';

class GetPopularMoviesCubit extends Cubit<GetPopularMoviesState> {
  GetPopularMoviesCubit(this.getPopularMoviesUseCase)
    : super(GetPopularMoviesInitial());

  final GetPopularMoviesUseCase getPopularMoviesUseCase;

  Future<void> getPopularMovies({required int page}) async {
    emit(const GetPopularMoviesLoadingState());
    final res = await getPopularMoviesUseCase.call(page: page);
    res.fold(
      (l) => emit(GetPopularMoviesErrorState(errorMessage: l.errorMessage)),
      (r) => emit(GetPopularMoviesLoadedState(moviesList: r)),
    );
  }
}
