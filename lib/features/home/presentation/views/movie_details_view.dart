import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/constants/api_constants.dart';
import 'package:movies_app/core/services/api_service.dart';
import 'package:movies_app/core/utils/app_text_styles.dart';
import 'package:movies_app/features/home/data/data_source/home_data_source.dart';
import 'package:movies_app/features/home/data/repos/home_repo_impl.dart';
import 'package:movies_app/features/home/domain/use_cases/get_movie_details_use_case.dart';
import 'package:movies_app/features/home/presentation/cubits/get_movie_details_cubit.dart';
import 'package:movies_app/features/home/presentation/widgets/generic_container.dart';

class MovieDetailsView extends StatelessWidget {
  const MovieDetailsView({super.key, required this.movieId});

  final int movieId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetMovieDetailsCubit(
        GetMovieDetailsUseCase(
          homeRepo: HomeRepoImpl(
            homeDataSource: HomeDataSourceImpl(apiService: ApiService()),
          ),
        ),
      )..getMovieDetails(movieId: movieId),
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: BlocBuilder<GetMovieDetailsCubit, GetMovieDetailsState>(
            builder: (context, state) {
              if (state is GetMovieDetailsLoaded) {
                return Column(
                  spacing: 5,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Stack(
                        children: [
                          Container(
                            width: double.infinity,

                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  '${ApiConstants.imagePath}${state.movieModel.backdropPath}',
                                ),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),

                          Positioned(
                            left: MediaQuery.sizeOf(context).width * .03,
                            top: MediaQuery.sizeOf(context).height * .035,
                            child: IconButton(
                              onPressed: () => Navigator.pop(context),
                              icon: const Icon(Icons.arrow_back_ios),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Column(
                          spacing: 10.h,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              state.movieModel.title ?? '',
                              textAlign: TextAlign.center,
                              style: AppTextStyles.semiBold28(context),
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      'Release date',
                                      style: AppTextStyles.semiBold16(context),
                                    ),
                                    Text(
                                      state.movieModel.releaseDate ?? '',
                                      style: AppTextStyles.medium12(context),
                                    ),
                                  ],
                                ),

                                Column(
                                  children: [
                                    Text(
                                      'Average Vote',
                                      style: AppTextStyles.semiBold16(context),
                                    ),
                                    Text(
                                      '${state.movieModel.voteAverage} ⭐',
                                      style: AppTextStyles.medium12(context),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            Text(
                              'OverView',
                              textAlign: TextAlign.center,
                              style: AppTextStyles.semiBold16(context),
                            ),

                            Text(
                              state.movieModel.overview ?? '',
                              maxLines: 5,

                              style: AppTextStyles.medium12(context),
                            ),

                            Text(
                              'genres',
                              textAlign: TextAlign.center,
                              style: AppTextStyles.semiBold16(context),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: state.movieModel.genres!
                                  .map(
                                    (e) => GenericContainer(
                                      title: e['name'],
                                    ),
                                  )
                                  .toList(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              } else if (state is GetMovieDetailsError) {
                return Center(
                  child: Text(state.errorMessage),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
