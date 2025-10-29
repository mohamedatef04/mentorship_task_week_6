import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_text_styles.dart';

class GenericContainer extends StatelessWidget {
  const GenericContainer({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        width: 80.w,
        height: 30.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.secondaryVariant,
        ),
        child: Center(
          child: Text(
            title,
            style: AppTextStyles.medium12(
              context,
            ).copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
