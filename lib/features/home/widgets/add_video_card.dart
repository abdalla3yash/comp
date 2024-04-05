import 'package:comp/config/theme/colors.dart';
import 'package:comp/core/utils/sheets.dart';
import 'package:comp/core/utils/values.dart';
import 'package:comp/core/view/components/pick_video_sheet.dart';
import 'package:comp/core/view/widgets/tap_effect.dart';
import 'package:comp/features/home/logic/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddVideoCard extends StatelessWidget {
  const AddVideoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return TapEffect(
      onClick: () => AppSheets.showBottomSheet(context,child: PickVideoSheet(onPickVideo: (video) => context.read<HomeCubit>().pickVideo(videoFile: video!) )),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: deviceHeight * 0.2,
          padding: const EdgeInsets.all(AppPadding.p8),
          decoration: BoxDecoration(
              color: AppColors.lightGrey,
              borderRadius: BorderRadius.circular(AppSize.s24)),
          child: const Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.video_settings_outlined,
                  size: AppSize.s56,
                ),
                Text('Add Video'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
