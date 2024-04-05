import 'package:comp/config/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ControlesBar extends StatefulWidget {
  final VideoPlayerController controller;
  const ControlesBar({super.key, required this.controller});

  @override
  State<ControlesBar> createState() => _ControlesBarState();
}

class _ControlesBarState extends State<ControlesBar> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (widget.controller.value.isPlaying) {
            widget.controller.pause();
          } else {
            widget.controller.play();
          }
        });
      },
      child: Stack(
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            reverseDuration: const Duration(milliseconds: 300),
            child: widget.controller.value.isPlaying
              ? const SizedBox.shrink()
              : Container(
                  color: AppColors.lightGrey,
                  child: const Center(child: Icon(Icons.play_arrow,size: 64, color: AppColors.red)),
                ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: VideoProgressIndicator(
              widget.controller,
              allowScrubbing: true,
              colors: const VideoProgressColors(
                playedColor: AppColors.red,
                bufferedColor: AppColors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
