import 'package:get_it/get_it.dart';
import 'package:qtec_video_player_app/data/core/api-client.dart';
import 'package:http/http.dart';
import 'package:qtec_video_player_app/data/data-sources/video-datasource.dart';
import 'package:qtec_video_player_app/data/repositories/video-repository-impl.dart';
import 'package:qtec_video_player_app/domain/repositories/video-repository.dart';
import 'package:qtec_video_player_app/presentation/blocs/video/video_bloc.dart';

import '../domain/usecases/get-trending-video-usecse.dart';

final getInstant = GetIt.I;
Future<void> initLocator() async {
  //?external:
  getInstant.registerLazySingleton<Client>(() => Client());
  getInstant
      .registerLazySingleton<ApiClient>(() => ApiClient(client: getInstant()));

  //?Data-source:
  getInstant.registerLazySingleton<VideoDataSource>(
      () => VideoDataSourceImpl(apiClient: getInstant()));

  //?Repository:
  getInstant.registerLazySingleton<VideoRepository>(
      () => VideoRepositoryImpl(videoDataSource: getInstant()));

  //?Usecase:
  getInstant.registerLazySingleton<GetTrendingVideoUsecase>(
      () => GetTrendingVideoUsecase(videoRepository: getInstant()));

  //?Bloc:
  getInstant.registerSingleton<VideoBloc>((VideoBloc(getInstant())));
}
