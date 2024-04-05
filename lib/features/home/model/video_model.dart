import 'dart:io';

import 'package:video_compress/video_compress.dart';


class VideoModel {
  String? name;
  dynamic videoThumbnail;
  File? videoPath;
  double videoSize;
  double compressedSize;
  MediaInfo? mediaInfo;

  VideoModel({
    this.name,
    this.videoThumbnail,
    this.videoPath,
    this.videoSize = 0.0,
    this.compressedSize = 0.0,
    this.mediaInfo,
  });

  void copyWith({
    String? name,
    dynamic videoThumbnail,
    File? videoPath,
    double? videoSize,
    double? compressedSize,
    MediaInfo? mediaInfo,
  }) {
    this.name = name ?? this.name;
    this.videoThumbnail = videoThumbnail ?? this.videoThumbnail;
    this.videoPath = videoPath ?? this.videoPath;
    this.videoSize = videoSize ?? this.videoSize;
    this.compressedSize = compressedSize ?? this.compressedSize;
    this.mediaInfo = mediaInfo ?? this.mediaInfo;
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
    };
  }
}
