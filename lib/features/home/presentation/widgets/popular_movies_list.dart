import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/features/home/presentation/widgets/playingnow_movies_item.dart';

class PopularMoviesList extends StatelessWidget {
  const PopularMoviesList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(bottom: 20.h),
          child: const PopularMoviesItem(),
        );
      },
    );
  }
}
