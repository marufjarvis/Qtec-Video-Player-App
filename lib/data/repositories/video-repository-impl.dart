import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:qtec_video_player_app/data/data-sources/video-datasource.dart';
import 'package:qtec_video_player_app/data/models/video-result-model.dart';
import 'package:qtec_video_player_app/domain/entities/app-error.dart';
import 'package:qtec_video_player_app/domain/entities/video-parm.dart';
import 'package:qtec_video_player_app/domain/repositories/video-repository.dart';

class VideoRepositoryImpl extends VideoRepository {
  final VideoDataSource _videoDataSource;

  VideoRepositoryImpl({required VideoDataSource videoDataSource})
      : _videoDataSource = videoDataSource;

  @override
  Future<Either<AppError, VideoResultModel>> getTrandingVideo(
      VideoParm parm) async {
    try {
      VideoResultModel videoResult =
          await _videoDataSource.getTrandingVideo(parm);

      return Right(videoResult);
    } on SocketException {
      return const Left(AppError(
          message: "No Internet Connection",
          appErrorType: AppErrorType.network));
    } catch (e) {
      return Left(
          AppError(message: e.toString(), appErrorType: AppErrorType.api));
    }
  }
}
