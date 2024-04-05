import 'dart:developer';
import 'package:comp/config/navigation/navigation.dart';
import 'package:comp/config/theme/colors.dart';
import 'package:comp/core/utils/values.dart';
import 'package:comp/core/view/widgets/alerts.dart';
import 'package:comp/core/view/widgets/custom_button.dart';
import 'package:comp/core/view/widgets/spaces.dart';
import 'package:comp/features/home/logic/home_cubit.dart';
import 'package:comp/features/home/model/video_model.dart';
import 'package:comp/features/home/widgets/loader_video_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VideoCard extends StatelessWidget {
  final VideoModel videoData;
  const VideoCard({super.key, required this.videoData});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      buildWhen: (previous, current) => current.requestType == RequestType.post,
      builder: (context, state) => state.requestType == RequestType.post &&
              state.requestState == RequestState.loading
          ? const LoaderVideoCard()
          : Container(
              height: deviceHeight * 0.2,
              padding: const EdgeInsets.all(AppPadding.p8),
              decoration: BoxDecoration(
                  color: AppColors.lightGrey,
                  borderRadius: BorderRadius.circular(AppSize.s24)),
              child: Row(
                children: [
                  Container(
                    width: deviceWidth * 0.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppSize.s24),
                      image: DecorationImage(
                        image: MemoryImage(videoData.videoThumbnail),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const HorizontalSpace(AppPadding.p8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: deviceWidth * 0.45,
                        child: Text(
                          videoData.name.toString(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                      SizedBox(
                        width: deviceWidth * 0.45,
                        child: Text(
                          'Original Size: ${videoData.videoSize.toStringAsFixed(2)} MB',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                      SizedBox(
                        width: deviceWidth * 0.45,
                        child: Text(
                          'Compressed Size: ${videoData.compressedSize.toStringAsFixed(2)} MB',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                      SizedBox(
                        width: deviceWidth * 0.45,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomButton(
                              borderRadius: AppSize.s8,
                              color: AppColors.primary,
                              text: "View",    
                              height: AppSize.s24,
                              onPressed: () => NavigationService.push(context, Routes.videoPlayerScreen, arguments: {'videoPath': videoData.mediaInfo!.file!.path}),
                            ),
                            CustomButton(
                              borderRadius: AppSize.s8,
                              color: AppColors.secondary,
                              text: "Upload",
                              height: AppSize.s24,
                              onPressed: () => Toaster('comming soon!'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
      listener: (context, state) {
        if (state.requestState == RequestState.failure) {
          log(state.failure!.message);
          Alerts(context, state.failure!.message);
        }
      },
    );
  }
}
