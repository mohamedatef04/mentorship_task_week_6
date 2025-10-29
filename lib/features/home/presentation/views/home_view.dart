import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/app_text_styles.dart';
import 'package:movies_app/features/home/presentation/widgets/custom_list_tile.dart';
import 'package:movies_app/features/home/presentation/widgets/popular_movies_list.dart';
import 'package:movies_app/features/home/presentation/widgets/search_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    spacing: 20.h,
                    children: const [
                      CustomListTile(),
                      SearchWidget(
                        hintText: 'Search for a movie',
                      ),
                      SizedBox(height: 15),
                    ],
                  ),
                ),

                SliverToBoxAdapter(
                  child: Text(
                    'Popular Movies',
                    style: AppTextStyles.semiBold16(context),
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(height: 20.h),
                ),
                const PopularMoviesList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
