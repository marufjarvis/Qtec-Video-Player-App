import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:qtec_video_player_app/contstant/extention.dart';
import 'package:qtec_video_player_app/contstant/string.dart';
import '../../../../contstant/color.dart';
import '../../../../contstant/utils.dart';
import '../../../../data/models/video-result-model.dart';
import '../../../widgets/image.dart';

class VideoItemWidget extends StatelessWidget {
  const VideoItemWidget({
    super.key,
    required this.video,
    required this.date,
  });

  final VideoResult video;
  final String date;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppString.videoViewRoute,
            arguments: video);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 20.h),
        height: 290.h,
        width: double.infinity,
        child: Column(children: [
          ThumnailImage(video: video),
          AppUtil.box(15.h),
          VideoInformation(video: video, date: date)
        ]),
      ),
    );
  }
}

class VideoInformation extends StatelessWidget {
  const VideoInformation({
    super.key,
    required this.video,
    required this.date,
  });

  final VideoResult video;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipOval(
            child: CachedNetworkImage(
              imageUrl: video.channelImage,
              errorWidget: (context, url, error) => const Icon(Icons.error),
              fit: BoxFit.cover,
              width: 40.h,
              height: 40.h,
            ),
          ),
          AppUtil.box(14.w),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                video.title,
                style: Theme.of(context).textTheme.bodyMedium,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              AppUtil.box(4.h),
              Text(
                "${video.viewers} views    $date",
                style: Theme.of(context).textTheme.bodySmall,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          )),
          Icon(
            Icons.more_vert,
            color: AppColor.greyColor,
            size: 16.h,
          )
        ],
      ),
    ));
  }
}

class ThumnailImage extends StatelessWidget {
  const ThumnailImage({
    super.key,
    required this.video,
  });

  final VideoResult video;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ImageWidget(image: video.thumbnail, size: 198.h),
        video.duration != "00:00"
            ? Positioned(
                right: 10.w,
                bottom: 10.w,
                child: Container(
                  // padding: const EdgeInsets.all(4.0),
                  height: 17.h,
                  alignment: Alignment.center,
                  width: 35.w,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(4.r)),
                  child: Text(
                    video.duration,
                    style: const TextStyle()
                        .bodySmallInter
                        .copyWith(color: Colors.white),
                  ),
                ),
              )
            : const SizedBox.shrink()
      ],
    );
  }
}
