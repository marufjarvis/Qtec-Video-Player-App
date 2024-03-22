import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qtec_video_player_app/di/locator.dart';
import 'package:qtec_video_player_app/presentation/blocs/video/video_bloc.dart';
import 'package:qtec_video_player_app/presentation/routes.dart';
import '../contstant/string.dart';
import 'themes/app-theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VideoApp extends StatelessWidget {
  const VideoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, snapshot) {
          return BlocProvider(
            create: (context) =>
                getInstant<VideoBloc>()..add(const VideoLoadEvent()),
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              onGenerateRoute: AppRoute.onGenerateRoute,
              title: AppString.appName,
              theme: AppTheme.themeData,
            ),
          );
        });
  }
}
