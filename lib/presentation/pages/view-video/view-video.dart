import 'package:flutter/material.dart';
import 'package:qtec_video_player_app/contstant/color.dart';
import 'package:qtec_video_player_app/data/models/video-result-model.dart';
import 'package:qtec_video_player_app/presentation/widgets/image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import '../../../contstant/utils.dart';
import 'components/comments-portion.dart';
import 'components/player-information.dart';

class ViewVideoPage extends StatefulWidget {
  final VideoResult video;

  const ViewVideoPage({Key? key, required this.video}) : super(key: key);

  @override
  State<ViewVideoPage> createState() => _ViewVideoPageState();
}

class _ViewVideoPageState extends State<ViewVideoPage> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayer();
  }

  void _initializeVideoPlayer() async {
    _videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(widget.video.manifest));

    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: 16.5 / 10,
      autoPlay: true,
      looping: true,
    );

    await _videoPlayerController.initialize();

    setState(() {});
    _chewieController.play();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final date = AppUtil.getDateTime(widget.video.dateAndTime).toString();
    const String asset = "assets/svg-icons";
    List<dynamic> actionList = [
      {"icon": "$asset/favorite.svg", 'title': "MASH ALLAH (12K)"},
      {"icon": "$asset/like.svg", 'title': "LIKE (12K)"},
      {"icon": "$asset/share.svg", 'title': "SHARE"},
      {"icon": "$asset/fram.svg", 'title': "REPORT"},
    ];
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 245, 245),
      body: ListView(
        children: [
          //Video Player
          Stack(
            children: [
              PlayerAction(chewieController: _chewieController, widget: widget),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: CircleAvatar(
                    backgroundColor: AppColor.whiteColor.withOpacity(0.3),
                    child: const Icon(
                      Icons.arrow_back,
                      color: AppColor.whiteColor,
                    ),
                  ),
                ),
              )
            ],
          ),

          //video infromation
          PlayerInformation(
            widget: widget,
            date: date,
            actionList: actionList,
          ),

          //divider line
          const Divider(
            thickness: 1,
            color: AppColor.greyColor300,
            height: 1,
          ),
          AppUtil.box(20.h),

          //comment box and list
          CommentsPortion(asset: asset, widget: widget)
        ],
      ),
    );
  }
}

class PlayerAction extends StatelessWidget {
  const PlayerAction({
    super.key,
    required ChewieController chewieController,
    required this.widget,
  }) : _chewieController = chewieController;

  final ChewieController _chewieController;
  final ViewVideoPage widget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 211.h,
      child: _chewieController.videoPlayerController.value.isInitialized
          ? SizedBox(
              height: 211.h,
              width: double.infinity,
              child: Chewie(controller: _chewieController),
            )
          : SizedBox(
              height: 211.h,
              child: Stack(
                children: [
                  ImageWidget(image: widget.video.thumbnail, size: 211.h),
                  Center(
                    child: CircularProgressIndicator(
                      color: Theme.of(context).primaryColor,
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
