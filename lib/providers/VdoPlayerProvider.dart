
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VdoPlayerProvider extends ChangeNotifier{
  String? _url;
   VideoPlayerController? _videoPlayerController;
   ChewieController? _chewieController;
  bool _isLoading = true;

  VideoPlayerController? get videoPlayerController=> _videoPlayerController;
  ChewieController? get chewieController => _chewieController;
  bool get loding=>_isLoading;

  Future<void> _initVideoPlay() async{
    String httpurl=_url!.replaceAll("myapp", "http");
    _videoPlayerController = VideoPlayerController.network(httpurl!)
    ..initialize().then((_){

      _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController!,
        autoPlay: true,
        looping: true,
        allowFullScreen: true,
        allowMuting: true,
        showControls: true,
        autoInitialize: true,
      );
      _isLoading=false;
      notifyListeners();
    });


  }

  void togglePlayPause(){

    if(_videoPlayerController!.value.isPlaying){
      _videoPlayerController!.pause();
    }
    else {_videoPlayerController!.play();}
    notifyListeners();

  }

  void _disposeControllers() {
    _videoPlayerController?.dispose();
    _chewieController?.dispose();
    _videoPlayerController = null;
    _chewieController = null;
  }

  @override
  void dispose() {
    _videoPlayerController!.dispose();
    _chewieController!.dispose();
    super.dispose();
  }

  void setUrl(String deepLink) async {
    _url=deepLink;
print("urllllllllllllll"+_url!);
    _disposeControllers();
    await _initVideoPlay();
  }


}