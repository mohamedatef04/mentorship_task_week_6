import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/features/home/presentation/cubits/get_popular_movies_cubit.dart';
import 'package:movies_app/features/home/presentation/widgets/playingnow_movies_item.dart';

class PopularMoviesList extends StatelessWidget {
  const PopularMoviesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetPopularMoviesCubit, GetPopularMoviesState>(
      builder: (context, state) {
        if (state is GetPopularMoviesLoadedState) {
          return SliverList.builder(
            itemCount: state.moviesList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(bottom: 20.h),
                child: PopularMoviesItem(
                  movieEntity: state.moviesList[index],
                ),
              );
            },
          );
        } else if (state is GetPopularMoviesErrorState) {
          return SliverToBoxAdapter(
            child: Center(
              child: Text(state.errorMessage),
            ),
          );
        } else {
          return const SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
