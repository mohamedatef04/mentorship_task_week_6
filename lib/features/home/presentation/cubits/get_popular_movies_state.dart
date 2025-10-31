part of 'get_popular_movies_cubit.dart';

abstract class GetPopularMoviesState extends Equatable {
  const GetPopularMoviesState();

  @override
  List<Object> get props => [];
}

class GetPopularMoviesInitial extends GetPopularMoviesState {}

class GetPopularMoviesLoadingState extends GetPopularMoviesState {
  final bool isLoadMore;

  const GetPopularMoviesLoadingState({this.isLoadMore = false});

  @override
  List<Object> get props => [isLoadMore];
}

class GetPopularMoviesLoadedState extends GetPopularMoviesState {
  final List<MovieEntity> moviesList;

  const GetPopularMoviesLoadedState({required this.moviesList});

  @override
  List<Object> get props => [moviesList];
}

class GetPopularMoviesErrorState extends GetPopularMoviesState {
  final String errorMessage;

  const GetPopularMoviesErrorState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
