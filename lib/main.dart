import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:movies_app/core/constants/api_constants.dart';
import 'package:movies_app/core/cubits/change_mode_cubit.dart';
import 'package:movies_app/features/home/data/models/movie_hive_model.dart';
import 'package:movies_app/features/splash/presentation/views/splash_view.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(MovieHiveModelAdapter());
  await Hive.openBox('moviesBox');
  if (kReleaseMode) {
    await SentryFlutter.init(
      (options) {
        options.dsn = ApiConstants.sentryDsn;
      },
      appRunner: () => runApp(const MoviesApp()),
    );
  } else {
    runApp(const MoviesApp());
  }
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: BlocProvider(
        create: (context) => ChangeModeCubit(),
        child: BlocBuilder<ChangeModeCubit, ThemeData>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: state,
              home: const SplashView(),
            );
          },
        ),
      ),
    );
  }
}
