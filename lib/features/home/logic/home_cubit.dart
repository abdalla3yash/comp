import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:comp/core/utils/logger.dart';
import 'package:comp/features/home/model/video_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_compress/video_compress.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState());

  Subscription? _subscription;

  Future pickVideo({required File videoFile}) async {
    emit(state.copyWith(requestType: RequestType.pick, requestState: RequestState.loading));
    List<VideoModel> allVideos = [...state.videos ?? []];

    try {
      // Subscribe to the compression progress
      _subscription = VideoCompress.compressProgress$.subscribe((progress) =>  emit(state.copyWith(requestType: RequestType.pick, requestState: RequestState.loading, progress: progress)));

      // Compress the video
      final result = await VideoCompress.compressVideo(videoFile.path, quality: VideoQuality.MediumQuality, deleteOrigin: false);

      // Get thumbnail image from the video
      final thumbnailResult = await VideoThumbnail.thumbnailData( video: videoFile.path, imageFormat: ImageFormat.WEBP, maxWidth: 128, quality: 85);
      
      if (kDebugMode) print(thumbnailResult);

      // Create a VideoModel instance with video data
      VideoModel newRecord = VideoModel(
        compressedSize: await getFileSize(result!.file!.path),
        name: videoFile.path.split('/').last,
        videoPath: result.file,
        videoSize: await getFileSize(videoFile.path),
        videoThumbnail: thumbnailResult,
        mediaInfo: result);

      // Unsubscribe from the stream
      _subscription!.unsubscribe();

      // Add the new record to the list of videos
      allVideos.add(newRecord);

      // Update state with the new list of videos
      emit(state.copyWith(videos: allVideos, requestState: RequestState.success, requestType: RequestType.pick));
    } catch (e) {
      log(e.toString());
      emit(state.copyWith(requestState: RequestState.failure, failure: e.toString(), requestType: RequestType.pick));
    }
  }


  Future cancel() async => _subscription!.unsubscribe();
}
