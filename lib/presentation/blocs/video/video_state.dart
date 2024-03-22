part of 'video_bloc.dart';

sealed class VideoState extends Equatable {
  const VideoState();

  @override
  List<Object> get props => [];
}

final class VideoInitial extends VideoState {}

final class VideoLoaded extends VideoState {
  final List<VideoResult> videoList;
  final bool isLastPage;

  const VideoLoaded({required this.videoList, this.isLastPage = false});

  @override
  List<Object> get props => [videoList];
}

final class VidoeLoading extends VideoState {
  final List<VideoResult> oldVideoList;
  final bool isFirstFetch;

  const VidoeLoading(this.oldVideoList, {this.isFirstFetch = false});

  @override
  List<Object> get props => [oldVideoList];
}

final class VideoLoadError extends VideoState {
  final AppError appError;

  const VideoLoadError({required this.appError});

  @override
  List<Object> get props => [appError];
}
