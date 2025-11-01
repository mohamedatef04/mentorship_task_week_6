part of 'get_movie_details_cubit.dart';

abstract class GetMovieDetailsState extends Equatable {
  const GetMovieDetailsState();

  @override
  List<Object> get props => [];
}

class GetMovieDetailsInitial extends GetMovieDetailsState {}

class GetMovieDetailsLoading extends GetMovieDetailsState {}

class GetMovieDetailsLoaded extends GetMovieDetailsState {
  final MovieModel movieModel;
  const GetMovieDetailsLoaded({required this.movieModel});
}

class GetMovieDetailsError extends GetMovieDetailsState {
  final String errorMessage;
  const GetMovieDetailsError({required this.errorMessage});
}
