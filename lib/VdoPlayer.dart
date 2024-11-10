import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class VdoPlayer extends StatefulWidget {
  final String url;

  VdoPlayer({required this.url});

  @override
  State<VdoPlayer> createState() => _VdoPlayerState();
}

class _VdoPlayerState extends State<VdoPlayer> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    // Initialize the VideoPlayerController
    _videoPlayerController = VideoPlayerController.network(
      widget.url,
    )
      ..initialize().then((_) {
        setState(() {
          _isLoading = false;
        });

        _chewieController = ChewieController(
          videoPlayerController: _videoPlayerController,
          autoPlay: true,
          looping: true,
          allowFullScreen: true,
          allowMuting: true,
          showControls: true,
          autoInitialize: true,
        );
      });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Video Player with loading indicator
            Center(
              child: _isLoading
                  ? CircularProgressIndicator() // Loading spinner while the video loads
                  : Chewie(controller: _chewieController),
            ),

            // Play/Pause Button that hides once the video is loaded
            if (!_isLoading)
              Positioned(
                bottom: 20,
                left: MediaQuery.of(context).size.width * 0.5 - 30,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      if (_videoPlayerController.value.isPlaying) {
                        _videoPlayerController.pause();
                      } else {
                        _videoPlayerController.play();
                      }
                    });
                  },
                  // child: CircleAvatar(
                  //   radius: 30,
                  //   backgroundColor: Colors.white.withOpacity(0.5),
                  //   child: Icon(
                  //     _videoPlayerController.value.isPlaying
                  //         ? Icons.pause
                  //         : Icons.play_arrow,
                  //     color: Colors.black,
                  //     size: 40,
                  //   ),
                  // ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
