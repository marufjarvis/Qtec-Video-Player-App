import 'package:dartz/dartz.dart';
import 'package:qtec_video_player_app/data/models/video-result-model.dart';
import 'package:qtec_video_player_app/domain/entities/app-error.dart';
import 'package:qtec_video_player_app/domain/entities/video-parm.dart';

abstract class VideoRepository {
  Future<Either<AppError, VideoResultModel>> getTrandingVideo(VideoParm parm);
}
