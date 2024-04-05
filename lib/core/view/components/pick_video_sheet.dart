import 'dart:io';
import 'package:comp/config/navigation/navigation_services.dart';
import 'package:comp/config/theme/colors.dart';
import 'package:comp/core/utils/picker.dart';
import 'package:comp/core/utils/values.dart';
import 'package:comp/core/view/widgets/custom_button.dart';
import 'package:comp/core/view/widgets/spaces.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PickVideoSheet extends StatelessWidget {
  final void Function(File? video) onPickVideo;

  const PickVideoSheet({required this.onPickVideo, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButton(
          isOutlined: true,
          onPressed: () async {
            final File? video = await Picker.pickVideo(ImageSource.gallery);
            NavigationService.goBack(context);
            onPickVideo(video);
          },
          child: const Row(
            children: [
              Icon(Icons.video_file),
              HorizontalSpace(AppSize.s8),
              Text("Gallery")
            ],
          ),
        ),
        const VerticalSpace(AppSize.s12),
        CustomButton(
          isOutlined: true,
          onPressed: () async {
            final File? video = await Picker.pickVideo(ImageSource.camera);
            NavigationService.goBack(context);
            onPickVideo(video);
          },
          child: const Row(
            children: [
              Icon(Icons.camera_alt),
              HorizontalSpace(AppSize.s8),
              Text('Camera'),
            ],
          ),
        ),
        const VerticalSpace(AppSize.s12),
        CustomButton(
          onPressed: () => NavigationService.goBack(context),
          color: AppColors.red,
          child: Row(
            children: [
              const Icon(Icons.cancel, color: AppColors.white),
              const HorizontalSpace(AppSize.s8),
              Text(
                'Cancel',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: AppColors.white),
              )
            ],
          ),
        ),
      ],
    );
  }
}
