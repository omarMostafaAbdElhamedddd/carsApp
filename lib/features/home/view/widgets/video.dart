import 'package:cars_app/conts.dart';
import 'package:cars_app/utitls/resposiveSize.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: VideoScreen(),
    );
  }
}

class VideoScreen extends StatefulWidget {
  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/video.mp4')
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
      });
  }



  bool isPlay = true;

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
               border: Border.all(color: secondColor)
              ),
              width: SizeConfig.screenWidth,
              height: SizeConfig.screenHeight! * .17,
              child: _controller.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: SizedBox(
                          width: _controller.value.size?.width ?? 0,
                          height: _controller.value.size?.height ?? 0,
                          child: VideoPlayer(_controller),
                        ),
                      ),
                    )
                  : SizedBox(
                  width: SizeConfig.screenWidth,
                  height: SizeConfig.screenHeight! * .17,
                  child: Center(child: CircularProgressIndicator(color: kPreimaryColor,))),
            ),
            IconButton(
                onPressed: () {
                  if (isPlay) {
                    isPlay = !isPlay;
                    _controller.pause();
                    setState(() {});
                  } else {
                    isPlay = !isPlay;
                    _controller.play();
                    setState(() {});
                  }
                },
                icon: Icon(
                  isPlay ? Icons.pause : Icons.play_arrow,
                  color: secondColor,
                  size: 40,
                )),

          ],
        ),
        CustomVerticalSizeBox(padding: .66,),
        VideoProgressIndicator(_controller, allowScrubbing: true)
      ],
    );

  }
}
