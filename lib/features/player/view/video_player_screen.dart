import 'package:comp/config/theme/colors.dart';
import 'package:comp/core/utils/values.dart';
import 'package:comp/features/player/widgets/controls_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:video_player/video_player.dart';
import 'dart:io';

class VideoPlayerScreen extends StatefulWidget {
  final String videoPath;

  const VideoPlayerScreen({super.key, required this.videoPath});

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    File videoFile = File(widget.videoPath);
    _controller = VideoPlayerController.file(videoFile);
    _initializeVideoPlayerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Comp.'), centerTitle: true),
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(AppPadding.p8),
                child: AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      VideoPlayer(_controller),
                      ControlesBar(controller: _controller),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return const Center(child: SpinKitCubeGrid(color: AppColors.primary, size: 64));
          }
        },
      ),
    );
  }
}
