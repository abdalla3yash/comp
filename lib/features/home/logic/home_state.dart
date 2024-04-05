part of 'home_cubit.dart';

enum RequestState { none, loading, success, failure }

enum RequestType { none, pick, post }

class HomeState {
  final RequestState requestState;
  final RequestType requestType;
  final Failure? failure;
  final List<VideoModel>? videos;
  final double? progress;

  HomeState({
    this.requestState = RequestState.none,
    this.requestType = RequestType.none,
    this.failure,
    this.videos,
    this.progress,
  });

  HomeState copyWith({
    RequestState? requestState,
    RequestType? requestType,
    Failure? failure,
    List<VideoModel>? videos,
    double? progress,
  }) =>
      HomeState(
        requestState: requestState ?? this.requestState,
        requestType: requestType ?? this.requestType,
        failure: failure,
        videos: videos ?? this.videos,
        progress: progress ?? this.progress,
      );
}
