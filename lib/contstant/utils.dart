import 'package:flutter/material.dart';
import 'package:qtec_video_player_app/data/core/api-constants.dart';
import 'package:intl/intl.dart';

class AppUtil {
  const AppUtil._();

  //?API url
  static String getTrendingAPI({int no = 1}) =>
      "${APIConstant.baseUrl}/trending-video/$no?page=1";

  //?Route
  static MaterialPageRoute chnagePage(Widget page) =>
      MaterialPageRoute(builder: (builder) => page);

  //mp
  static SizedBox box(double size) => SizedBox(
        height: size,
        width: size,
      );
  static getDateTime(DateTime dateTime) => DateFormat.yMMMd().format(dateTime);
}
