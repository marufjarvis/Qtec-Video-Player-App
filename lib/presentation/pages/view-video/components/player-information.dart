import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qtec_video_player_app/contstant/string.dart';
import '../../../../contstant/color.dart';
import '../../../../contstant/utils.dart';
import '../view-video.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PlayerInformation extends StatelessWidget {
  const PlayerInformation({
    super.key,
    required this.widget,
    required this.date,
    required this.actionList,
  });

  final String date;
  final List actionList;
  final ViewVideoPage widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.video.title,
            style: Theme.of(context).textTheme.bodyMedium,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          AppUtil.box(4.h),
          Text(
            "${widget.video.viewers} views    $date",
            style: Theme.of(context).textTheme.bodySmall,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          AppUtil.box(16.h),
          ActionList(actionList: actionList),
          AppUtil.box(12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipOval(
                      child: CachedNetworkImage(
                        imageUrl: widget.video.channelImage,
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                        fit: BoxFit.cover,
                        width: 40.h,
                        height: 40.h,
                      ),
                    ),
                    AppUtil.box(10.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.video.channelName,
                            style: Theme.of(context).textTheme.bodyMedium,
                            maxLines: 2,
                          ),
                          AppUtil.box(2.h),
                          Text(
                            "${widget.video.channelSubscriber}M Subscribers",
                            style: Theme.of(context).textTheme.bodySmall,
                            maxLines: 1,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SubscriberButton()
            ],
          ),
        ],
      ),
    );
  }
}

class SubscriberButton extends StatelessWidget {
  const SubscriberButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: const ButtonStyle(
            minimumSize: MaterialStatePropertyAll(Size(30, 40)),
            elevation: MaterialStatePropertyAll(0.0)),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.add,
              size: 15.33.h,
            ),
            AppUtil.box(10.w),
            Text(
              "Subscribe",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: Theme.of(context).scaffoldBackgroundColor),
            )
          ],
        ));
  }
}

class ActionList extends StatelessWidget {
  const ActionList({
    super.key,
    required this.actionList,
  });

  final List actionList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: Row(
          children: List.generate(
              actionList.length,
              (index) => GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, AppString.emptyPageRoute,
                          arguments: actionList[index]['title']);
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 10.w),
                      padding: EdgeInsets.all(10.w),
                      decoration: BoxDecoration(
                        border:
                            Border.all(width: 1, color: AppColor.greyColor300),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            actionList[index]['icon'],
                            height: 18.w,
                            width: 18.w,
                          ),
                          AppUtil.box(3.h),
                          Text(
                            actionList[index]['title'],
                            style: Theme.of(context).textTheme.bodySmall,
                          )
                        ],
                      ),
                    ),
                  )),
        ),
      ),
    );
  }
}
