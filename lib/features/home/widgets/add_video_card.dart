import 'package:comp/config/theme/colors.dart';
import 'package:comp/core/view/widgets/tap_effect.dart';
import 'package:flutter/material.dart';

class AddVideoCard extends StatelessWidget {
  const AddVideoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return TapEffect(
      onClick: () => null,
      child: Container(
        height: 200,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: AppColors.lightGrey,
            borderRadius: BorderRadius.circular(24)),
        child: const Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.video_settings_outlined,
                size: 64,
              ),
              Text('Add Video'),
            ],
          ),
        ),
      ),
    );
  }
}
