import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerControllerX extends GetxController {
  late VideoPlayerController _controller;

  @override
  void onInit() {
    super.onInit();
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(
        "https://firebasestorage.googleapis.com/v0/b/bln-db-81cb4.appspot.com/o/som2023.mp4?alt=media&token=7246c801-8ca3-4833-86bc-d2e98e55966d",
      ),)..initialize().then((_) {
      update();
    });
    // _controller.setLooping(true);
  }

  @override
  void onClose() {
    super.onClose();
    _controller.dispose();
  }

  VideoPlayerController get controller => _controller;
}
