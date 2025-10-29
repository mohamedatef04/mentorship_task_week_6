import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/cubits/change_mode_cubit.dart';
import 'package:movies_app/core/theme/app_themes.dart';
import 'package:movies_app/core/utils/app_text_styles.dart';
import 'package:movies_app/core/utils/assets.dart';

class CustomListTile extends StatefulWidget {
  const CustomListTile({
    super.key,
  });

  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        width: 50.w,
        height: 50.h,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage(Assets.imagesAvatar),
            fit: BoxFit.fill,
          ),
        ),
      ),
      title: Text(
        'Welcome !',
        style: AppTextStyles.semiBold16(context),
      ),
      subtitle: Text(
        'let\'s find your favorite movie',
        style: AppTextStyles.medium12(context),
      ),

      trailing: Container(
        width: 30.w,
        height: 30.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).colorScheme.onSecondaryContainer,
        ),
        child: IconButton(
          onPressed: () {
            final currentTheme = context.read<ChangeModeCubit>().state;
            context.read<ChangeModeCubit>().changeMode(
              theme: currentTheme == AppTheme.getLightTheme()
                  ? AppTheme.getDarkTheme()
                  : AppTheme.getLightTheme(),
            );
          },
          icon: const Icon(
            Icons.light_mode,
            size: 15,
          ),
        ),
      ),
    );
  }
}
