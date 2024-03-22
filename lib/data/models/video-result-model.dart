// ignore_for_file: annotate_overrides, overridden_fields

import 'dart:convert';

VideoResultModel getVideoFromJson(String str) =>
    VideoResultModel.fromMap(json.decode(str));

class VideoResultModel {
  final Links links;
  final int total;
  final int page;
  final int pageSize;
  final List<VideoResult> results;

  VideoResultModel({
    required this.links,
    required this.total,
    required this.page,
    required this.pageSize,
    required this.results,
  });

  factory VideoResultModel.fromMap(Map<String, dynamic> map) {
    return VideoResultModel(
      links: Links.fromMap(map['links']),
      total: map['total'],
      page: map['page'],
      pageSize: map['page_size'],
      results: List<VideoResult>.from(
        (map['results'] as List).map((result) => VideoResult.fromMap(result)),
      ),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'links': links.toMap(),
      'total': total,
      'page': page,
      'page_size': pageSize,
      'results': List<dynamic>.from(results.map((result) => result.toMap())),
    };
  }
}

class Links {
  final dynamic next;
  final dynamic previous;

  Links({
    required this.next,
    required this.previous,
  });

  factory Links.fromMap(Map<String, dynamic> map) {
    return Links(
      next: map['next'],
      previous: map['previous'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'next': next,
      'previous': previous,
    };
  }
}

class VideoResult {
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

  VideoResult({
    required this.thumbnail,
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
    required this.duration,
  });

  factory VideoResult.fromMap(Map<String, dynamic> map) {
    return VideoResult(
      thumbnail: map['thumbnail'] ?? "",
      id: map['id'],
      title: map['title'] ?? "",
      dateAndTime: DateTime.parse(map['date_and_time']),
      slug: map['slug'] ?? "",
      createdAt: DateTime.parse(map['created_at']),
      manifest: map['manifest'] ?? "",
      liveStatus: map['live_status'] ?? "",
      liveManifest: map['live_manifest'] ?? "",
      isLive: map['is_live'],
      channelImage: map['channel_image'] ?? "",
      channelName: map['channel_name'] ?? "",
      isVerified: map['is_verified'],
      channelSlug: map['channel_slug'] ?? "",
      channelSubscriber: map['channel_subscriber'] ?? "",
      channelId: map['channel_id'],
      type: map['type'] ?? "",
      viewers: map['viewers'] ?? "",
      duration: map['duration'] ?? "",
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'thumbnail': thumbnail,
      'id': id,
      'title': title,
      'date_and_time': dateAndTime.toIso8601String(),
      'slug': slug,
      'created_at': createdAt.toIso8601String(),
      'manifest': manifest,
      'live_status': liveStatus,
      'live_manifest': liveManifest,
      'is_live': isLive,
      'channel_image': channelImage,
      'channel_name': channelName,
      'is_verified': isVerified,
      'channel_slug': channelSlug,
      'channel_subscriber': channelSubscriber,
      'channel_id': channelId,
      'type': type,
      'viewers': viewers,
      'duration': duration,
    };
  }
}
