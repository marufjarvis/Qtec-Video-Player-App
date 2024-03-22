import 'package:dartz/dartz.dart';
import 'package:qtec_video_player_app/data/models/video-result-model.dart';
import 'package:qtec_video_player_app/domain/entities/app-error.dart';
import 'package:qtec_video_player_app/domain/entities/video-parm.dart';
import 'package:qtec_video_player_app/domain/repositories/video-repository.dart';
import 'package:qtec_video_player_app/domain/usecases/usecase.dart';

class GetTrendingVideoUsecase extends Usecase<VideoResultModel, VideoParm> {
  final VideoRepository _videoRepository;

  GetTrendingVideoUsecase({required VideoRepository videoRepository})
      : _videoRepository = videoRepository;

  @override
  Future<Either<AppError, VideoResultModel>> call(VideoParm parms) async {
    return await _videoRepository.getTrandingVideo(parms);
  }
}
