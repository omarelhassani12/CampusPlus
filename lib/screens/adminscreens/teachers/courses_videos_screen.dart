import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

class VideoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 3,
        padding: EdgeInsets.all(16.0),
        children: [
          VideoItemWidget(videoUrl: 'video_url_1'),
          VideoItemWidget(videoUrl: 'video_url_2'),
          VideoItemWidget(videoUrl: 'video_url_3'),
        ],
      ),
    );
  }
}

class VideoItemWidget extends StatelessWidget {
  final String videoUrl;

  const VideoItemWidget({required this.videoUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle video item click
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Container(
          margin: EdgeInsets.all(8.0),
          color: Colors.grey[200],
          child: Center(
            child: Text(
              'Video 1',
              style: TextStyle(fontSize: 18.0),
            ),
          ),
        ),
      ),
    );
  }
}
