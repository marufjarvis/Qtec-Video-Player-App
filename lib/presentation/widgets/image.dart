import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../contstant/color.dart';
import '../../data/models/video-result-model.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    super.key,
    required this.image,
    required this.size,
  });

  final String image;
  final double size;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      placeholder: (context, url) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 150.w, vertical: 88.w),
        child: CircularProgressIndicator(
          color: Theme.of(context).primaryColor,
        ),
      ),
      imageUrl: image,
      width: double.infinity,
      height: size,
      fit: BoxFit.cover,
      errorWidget: (context, url, error) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.image_not_supported,
              color: AppColor.greyColor.withOpacity(0.4),
              size: 120.h,
            ),
            const Text("Image Error"),
            Icon(
              Icons.error,
              color: Colors.red,
              size: 30.h,
            ),
          ],
        );
      },
    );
  }
}
