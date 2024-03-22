import 'package:equatable/equatable.dart';

class VideoEntity extends Equatable {
  final String thumbnail;
  final int id;
  final String title;
  final DateTime dateAndTime;
  final String slug;
  final DateTime createdAt;
  final String manifest;
  final int liveStatus;
  final dynamic liveManifest;
  final bool isLive;
  final String channelImage;
  final String channelName;
  final bool isVerified;
  final String channelSlug;
  final String channelSubscriber;
  final int channelId;
  final String type;
  final String viewers;
  final String duration;

  const VideoEntity(
      {required this.thumbnail,
      required this.id,
      required this.title,
      required this.dateAndTime,
      required this.slug,
      required this.createdAt,
      required this.manifest,
      required this.liveStatus,
      required this.liveManifest,
      required this.isLive,
      required this.channelImage,
      required this.channelName,
      required this.isVerified,
      required this.channelSlug,
      required this.channelSubscriber,
      required this.channelId,
      required this.type,
      required this.viewers,
      required this.duration});

  @override
  List<Object?> get props => [id, title];

  @override
  bool get stringify => true;
}
