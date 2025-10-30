part of 'get_popular_movies_cubit.dart';

@immutable
abstract class GetPopularMoviesState extends Equatable {}

class GetPopularMoviesInitial extends GetPopularMoviesState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class GetPopularMoviesLoadingState extends GetPopularMoviesState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class GetPopularMoviesLoadedState extends GetPopularMoviesState {
  final List<MovieEntity> moviesList;
  GetPopularMoviesLoadedState({required this.moviesList});
  @override
  List<Object?> get props => moviesList;
}

class GetPopularMoviesErrorState extends GetPopularMoviesState {
  final String errorMessage;
  GetPopularMoviesErrorState({required this.errorMessage});
  @override
  List<Object?> get props => throw UnimplementedError();
}
