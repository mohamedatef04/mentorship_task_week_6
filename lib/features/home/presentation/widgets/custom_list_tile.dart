import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/app_text_styles.dart';
import 'package:movies_app/core/utils/assets.dart';

class CustomListTile extends StatefulWidget {
  const CustomListTile({super.key, this.onPressed});
  final void Function()? onPressed;

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
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        child: IconButton(
          onPressed: widget.onPressed,
          icon: Icon(
            Icons.light_mode,
            size: 15,
          ),
        ),
      ),
    );
  }
}
