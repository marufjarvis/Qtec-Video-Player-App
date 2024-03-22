import 'package:qtec_video_player_app/contstant/utils.dart';
import 'package:qtec_video_player_app/data/core/api-client.dart';
import 'package:qtec_video_player_app/data/models/video-result-model.dart';
import 'package:qtec_video_player_app/domain/entities/video-parm.dart';

abstract class VideoDataSource {
  Future<VideoResultModel> getTrandingVideo(VideoParm parm);
}

class VideoDataSourceImpl extends VideoDataSource {
  final ApiClient _apiClient;

  VideoDataSourceImpl({required ApiClient apiClient}) : _apiClient = apiClient;

  @override
  Future<VideoResultModel> getTrandingVideo(VideoParm parm) async {
    String url = AppUtil.getTrendingAPI(no: parm.no);
    VideoResultModel videoResult =
        VideoResultModel.fromMap(await _apiClient.get(url));
    return videoResult;
  }
}
