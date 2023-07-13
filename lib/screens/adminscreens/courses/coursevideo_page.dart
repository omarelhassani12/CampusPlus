// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
// import 'package:chewie/chewie.dart';

// class CourseVideoPage extends StatelessWidget {
//   final String videoUrl;

//   const CourseVideoPage({Key? key, required this.videoUrl}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final videoPlayerController = VideoPlayerController.network(videoUrl);
//     final chewieController = ChewieController(
//       videoPlayerController: videoPlayerController,
//       autoPlay: true,
//       looping: true,
//       // You can customize the Chewie player options here
//       // For example, you can define video subtitles, aspect ratio, etc.
//     );

//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'Course Video Page',
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 16.0),
//             Chewie(
//               controller: chewieController,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class CourseVideoPage extends StatelessWidget {
  final String videoUrl;

  const CourseVideoPage(
      {Key? key, required this.videoUrl, required String videos})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'Course Video Page',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            if (videoUrl.isNotEmpty)
              Text(videoUrl)
            else
              const Text('No video available.'),
          ],
        ),
      ),
    );
  }
}
