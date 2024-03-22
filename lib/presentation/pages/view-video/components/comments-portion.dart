import 'package:flutter/material.dart';

import '../../../../contstant/color.dart';
import '../../../../contstant/utils.dart';
import '../view-video.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CommentsPortion extends StatelessWidget {
  const CommentsPortion({
    super.key,
    required this.asset,
    required this.widget,
  });

  final String asset;
  final ViewVideoPage widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Comments  7.5K",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  SvgPicture.asset("$asset/arrowtopdown.svg")
                ],
              ),
              AppUtil.box(15.h),
            ],
          ),
        ),
        CommentBox(asset: asset),
        AppUtil.box(15.h),
        CommentList(widget: widget),
      ],
    );
  }
}

class CommentList extends StatelessWidget {
  const CommentList({
    super.key,
    required this.widget,
  });

  final ViewVideoPage widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(2, (index) => CommentItem(widget: widget)),
    );
  }
}

class CommentItem extends StatelessWidget {
  const CommentItem({
    super.key,
    required this.widget,
  });

  final ViewVideoPage widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
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
                      RichText(
                        text: TextSpan(
                            text: "Fahmida khanom",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.normal,
                                    color: AppColor.greyColor),
                            children: [
                              TextSpan(
                                  text: "   2 days ago",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                          fontSize: 10.sp,
                                          color: AppColor.greyColor))
                            ]),
                      ),
                      Text(
                          "VoiceLegal is an innovative mobile application aimed at streamlining the process of cyber crime analysis and connecting users with experienced lawyers",
                          maxLines: 3,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                  fontSize: 13.sp, color: AppColor.greyColor))
                    ],
                  ),
                )
              ],
            ),
          ),
          AppUtil.box(14.h),
          const Divider(
            height: 1,
            thickness: 1,
            color: AppColor.greyColor300,
          ),
          AppUtil.box(14.h),
        ],
      ),
    );
  }
}

class CommentBox extends StatelessWidget {
  const CommentBox({
    super.key,
    required this.asset,
  });

  final String asset;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w),
      height: 55.h,
      child: TextField(
        decoration: InputDecoration(
          suffixIcon: Padding(
            padding: EdgeInsets.all(13.w),
            child: SvgPicture.asset(
              "$asset/send.svg",
            ),
          ),
          hintStyle: Theme.of(context).textTheme.bodySmall,
          isDense: false,
          hintText: "Add Comments",
          fillColor: Theme.of(context).scaffoldBackgroundColor,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: const BorderSide(color: AppColor.greyColor300),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: const BorderSide(color: AppColor.greyColor300),
          ),
        ),
      ),
    );
  }
}
