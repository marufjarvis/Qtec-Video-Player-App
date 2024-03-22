import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qtec_video_player_app/contstant/utils.dart';
import 'package:qtec_video_player_app/data/models/video-result-model.dart';
import 'package:qtec_video_player_app/di/locator.dart';
import 'package:qtec_video_player_app/presentation/blocs/video/video_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'components/app-bar.dart';
import 'components/video-item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late VideoBloc _videoBloc;

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _videoBloc = getInstant<VideoBloc>();
    _scrollController.addListener(loadMoreVideo);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void loadMoreVideo() {
    if (_scrollController.position.atEdge) {
      if (_scrollController.position.pixels != 0) {
        _videoBloc.add(const VideoLoadEvent());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //!Home Appbar
      appBar: homeAppbar(context),

      //!Home Body
      body: BlocBuilder<VideoBloc, VideoState>(
        builder: (context, state) {
          if (state is VidoeLoading && state.isFirstFetch) {
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            );
          }

          if (state is VideoLoadError) {
            return Center(
              child: Text(
                state.appError.message,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            );
          }

          var videos = <VideoResult>[];
          bool isLoading = false;
          bool isLastPage = false;
          if (state is VidoeLoading) {
            videos = state.oldVideoList;
            if (isLastPage == true) {
              isLoading = false;
            } else {
              isLoading = true;
            }
          } else if (state is VideoLoaded) {
            videos = state.videoList;

            isLastPage = state.isLastPage;
          }

          return Column(children: [
            //!Video List
            Expanded(
              child: ListView.builder(
                  controller: _scrollController,
                  padding: EdgeInsets.symmetric(horizontal: 14.w),
                  itemCount: videos.length,
                  itemBuilder: (context, index) {
                    final video = videos[index];
                    final date =
                        AppUtil.getDateTime(video.dateAndTime).toString();

                    return VideoItemWidget(video: video, date: date);
                  }),
            ),

            //!More Loading Indicator
            isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                      backgroundColor: Colors.amber,
                    ),
                  )
                : const SizedBox.shrink(),

            //!All Video Reached
            isLastPage
                ? Center(
                    child: Text(
                      "All Vidoe Loaded",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  )
                : const SizedBox.shrink()
          ]);
        },
      ),
    );
  }
}
