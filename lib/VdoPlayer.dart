import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';

import 'package:provider/provider.dart';
import 'package:vdo_player/providers/VdoPlayerProvider.dart';
import 'package:video_player/video_player.dart';

class VdoPlayer extends StatelessWidget {

    Widget build(BuildContext context){
      final videoPlayerProvider=Provider.of<VdoPlayerProvider>(context);

    // Future<void> secureScreen() async{
    //   await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
    // }
    // secureScreen();
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Video Player with loading indicator
            Center(
              child: videoPlayerProvider.loding?
                  CircularProgressIndicator()
                  : Chewie(controller: videoPlayerProvider.chewieController!)
            ),

            // Play/Pause Button that hides once the video is loaded
            if (!videoPlayerProvider.loding)
              Positioned(
                bottom: 20,
                left: MediaQuery.of(context).size.width * 0.5 - 30,
                child: GestureDetector(
                  onTap:
                  videoPlayerProvider.togglePlayPause,
                  // child: CircleAvatar(
                  //   radius: 30,
                  //   backgroundColor: Colors.white.withOpacity(0.5),
                  // ),

                ),
              ),
          ],
        ),
      ),
    );
  }
}
