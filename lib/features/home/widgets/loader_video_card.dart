import 'package:comp/config/theme/colors.dart';
import 'package:comp/core/utils/values.dart';
import 'package:comp/core/view/widgets/spaces.dart';
import 'package:comp/core/view/widgets/tap_effect.dart';
import 'package:comp/features/home/logic/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoaderVideoCard extends StatelessWidget {
  const LoaderVideoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return TapEffect(
            onClick: () => context.read<HomeCubit>().cancel(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: deviceHeight * 0.2,
                padding: const EdgeInsets.all(AppPadding.p8),
                decoration: BoxDecoration(
                    color: AppColors.lightGrey,
                    borderRadius: BorderRadius.circular(AppSize.s24)),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SpinKitCubeGrid(color: AppColors.primary, size: 52),
                      const VerticalSpace(AppPadding.p8),
                      if (state.progress != null)
                        Text('${state.progress.toString().substring(0, 2)} %',
                          style: const TextStyle(fontSize: 18, color: AppColors.black)),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
