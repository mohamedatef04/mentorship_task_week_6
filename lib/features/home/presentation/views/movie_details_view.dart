import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/app_text_styles.dart';
import 'package:movies_app/core/utils/assets.dart';
import 'package:movies_app/features/home/presentation/widgets/generic_container.dart';

class MovieDetailsView extends StatelessWidget {
  const MovieDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          spacing: 5,
          children: [
            Expanded(
              flex: 4,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,

                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          Assets.imagesImage,
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
                      'The Hobbit: An Unexpected Journey',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.semiBold28(context),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Release date',
                          style: AppTextStyles.semiBold16(context),
                        ),
                        Text(
                          '2023',
                          style: AppTextStyles.medium12(context),
                        ),

                        Text(
                          'Average Vote',
                          style: AppTextStyles.semiBold16(context),
                        ),
                        Text('8 ⭐', style: AppTextStyles.medium12(context)),
                      ],
                    ),

                    Text(
                      'OverView',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.semiBold16(context),
                    ),

                    Text(
                      'Originally a story from Archie Comics which started in 1941, Riverdale centres around a group of high school students who are shocked by the death of classmate, Jason Blossom. Together theyunravel the secrets of Riverdale and who More',
                      maxLines: 5,

                      style: AppTextStyles.medium12(context),
                    ),

                    Text(
                      'genres',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.semiBold16(context),
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GenericContainer(title: 'Action'),
                        GenericContainer(title: 'Adventure'),
                        GenericContainer(title: 'Fantasy'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
