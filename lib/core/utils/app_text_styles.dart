import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppTextStyles {
  static TextStyle semiBold28(BuildContext context) {
    final theme = Theme.of(context);
    return TextStyle(
      color: theme.colorScheme.primary,
      fontWeight: FontWeight.w600,
      fontSize: 28.sp,
      fontFamily: 'Poppins',
    );
  }

  static TextStyle semiBold16(BuildContext context) {
    final theme = Theme.of(context);
    return TextStyle(
      color: theme.colorScheme.primary,
      fontWeight: FontWeight.w600,
      fontSize: 16.sp,
      fontFamily: 'Poppins',
    );
  }

  static TextStyle medium12(BuildContext context) {
    return TextStyle(
      color: const Color(0xff92929D),
      fontWeight: FontWeight.w500,
      fontSize: 12.sp,
      fontFamily: 'Poppins',
    );
  }
}
