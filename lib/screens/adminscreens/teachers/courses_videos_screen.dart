import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

class VideoScreen extends StatelessWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 3,
        padding: const EdgeInsets.all(16.0),
        children: const [
          VideoItemWidget(
              videoUrl: 'video_url_1', imagePath: 'assets/videos/video1.png'),
          VideoItemWidget(
              videoUrl: 'video_url_2', imagePath: 'assets/videos/video2.png'),
          VideoItemWidget(
              videoUrl: 'video_url_3', imagePath: 'assets/videos/video3.png'),
        ],
      ),
    );
  }
}

class VideoItemWidget extends StatelessWidget {
  final String videoUrl;
  final String imagePath;

  const VideoItemWidget(
      {Key? key, required this.videoUrl, required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Stack(
        children: [
          Image.asset(
            imagePath,
            width: 100,
            height: 100,
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Icon(
                Icons.play_circle_filled,
                size: 30,
                color: ColorsApp.whiteClr,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
