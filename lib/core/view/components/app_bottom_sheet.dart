import 'package:comp/config/theme/colors.dart';
import 'package:comp/core/utils/values.dart';
import 'package:comp/core/view/widgets/spaces.dart';
import 'package:flutter/material.dart';

class AppBottomSheet extends StatelessWidget {
  final Widget child;

  const AppBottomSheet({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppPadding.p16)
          .copyWith(bottom: MediaQuery.of(context).viewInsets.bottom),
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppSize.s32)),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: AppSize.s4,
              width: AppSize.s100,
              decoration: const ShapeDecoration(color: AppColors.grey, shape: StadiumBorder()),
            ),
            const VerticalSpace(AppSize.s16),
            Flexible(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: AppPadding.p16),
                child: child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
