import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_text_styles.dart';
import 'package:movies_app/core/utils/assets.dart';
import 'package:movies_app/features/home/presentation/views/movie_details_view.dart';

class PopularMoviesItem extends StatelessWidget {
  const PopularMoviesItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const MovieDetailsView()),
        );
      },
      child: SizedBox(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Theme.of(context).colorScheme.primary,
          ),
          child: Row(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  width: 140,
                  height: 190,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    image: const DecorationImage(
                      image: AssetImage(Assets.imagesImage),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  spacing: 5,
                  children: [
                    Text(
                      'The Shawshank Redemption',
                      style: AppTextStyles.semiBold16(context),
                      maxLines: 2,
                    ),
                    Row(
                      children: [
                        Image.asset(Assets.imagesCalendar, width: 20.w),
                        Text(
                          '2022',
                          style: AppTextStyles.medium12(context),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.numbers,
                          color: AppColors.secondaryVariant,
                          size: 20.w,
                        ),
                        Text(
                          '1888',
                          style: AppTextStyles.medium12(context),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () async {},
                      child: Container(
                        width: 120,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.cyan,
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Play ',
                              style: TextStyle(fontSize: 18),
                            ),
                            Icon(Icons.play_arrow),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
