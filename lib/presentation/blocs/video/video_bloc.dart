// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:qtec_video_player_app/di/locator.dart';
import 'package:qtec_video_player_app/domain/entities/app-error.dart';
import 'package:qtec_video_player_app/domain/entities/video-parm.dart';
import 'package:qtec_video_player_app/domain/usecases/get-trending-video-usecse.dart';

import '../../../data/models/video-result-model.dart';
import 'package:dartz/dartz.dart';

part 'video_event.dart';
part 'video_state.dart';

class VideoBloc extends Bloc<VideoEvent, VideoState> {
  final GetTrendingVideoUsecase getTrendingVideoUsecase;

  int no = 1;
  int totalPage = 10;

  VideoBloc(this.getTrendingVideoUsecase) : super(VideoInitial()) {
    on<VideoLoadEvent>((event, emit) async {
      if (state is VidoeLoading) return;

      final currentState = state;
      var oldVidoeList = <VideoResult>[];

      if (currentState is VideoLoaded) {
        oldVidoeList = currentState.videoList;
      }

      emit(VidoeLoading(oldVidoeList, isFirstFetch: no == 1));

      final Either<AppError, VideoResultModel> eitherVideoReponst =
          await getTrendingVideoUsecase(VideoParm(no: no));
      print("No: $no");

      if (totalPage >= no) {
        eitherVideoReponst
            .fold((error) => emit(VideoLoadError(appError: error)), (video) {
          totalPage = video.pageSize;
          no++;

          print("toto page:$totalPage");

          final videoList = (state as VidoeLoading).oldVideoList;
          videoList.addAll(video.results);

          emit(VideoLoaded(videoList: videoList));
        });
      } else {
        emit(VideoLoaded(videoList: oldVidoeList, isLastPage: true));
      }
    });
  }
}
