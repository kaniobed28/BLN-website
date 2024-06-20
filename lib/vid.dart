import 'package:bln_website/video_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: VideoPlayerScreen(),
    );
  }
}

class VideoPlayerScreen extends StatelessWidget {
  final VideoPlayerControllerX controllerX = Get.put(VideoPlayerControllerX());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: const VideoCard(),
      floatingActionButton: VideoController(),
    );
  }

  FloatingActionButton   VideoController() {
    return FloatingActionButton(
      onPressed: () {
        controllerX.controller.value.isPlaying
            ? controllerX.controller.pause()
            : controllerX.controller.play();
      },
      child: GetBuilder<VideoPlayerControllerX>(
        builder: (controller) {
          return Icon(
            controller.controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          );
        },
      ),
    );
  }
}

class VideoCard extends StatelessWidget {
  const VideoCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GetBuilder<VideoPlayerControllerX>(
        builder: (controller) {
          return controller.controller.value.isInitialized
              ? AspectRatio(
                  aspectRatio: controller.controller.value.aspectRatio,
                  child: VideoPlayer(controller.controller),
                )
              : const CircularProgressIndicator();
        },
      ),
    );
  }
}
