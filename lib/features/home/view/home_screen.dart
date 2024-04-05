import 'package:comp/core/utils/values.dart';
import 'package:comp/core/view/widgets/alerts.dart';
import 'package:comp/core/view/widgets/spaces.dart';
import 'package:comp/features/home/logic/home_cubit.dart';
import 'package:comp/features/home/widgets/add_video_card.dart';
import 'package:comp/features/home/widgets/loader_video_card.dart';
import 'package:comp/features/home/widgets/video_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toast/toast.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
        appBar: AppBar(title: const Text('COMP.'), centerTitle: true),
        body: SingleChildScrollView(
          child: SafeArea(
            child: BlocConsumer<HomeCubit, HomeState>(
              listenWhen: (prevState, state) => state.requestType == RequestType.pick,
              listener: (context, state) {
                if (state.requestState == RequestState.failure) {
                  Alerts(context, state.failure!.message);
                }
              },
              builder: (context, state) => Column(
                children: [
                  state.videos == null
                    ? const SizedBox()
                    : ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.all(AppPadding.p8),
                        itemCount: state.videos!.length,
                        separatorBuilder: (context, index) => const VerticalSpace(AppPadding.p8),
                        itemBuilder: (context, index) => VideoCard(videoData: state.videos![index]),
                      ),
                  state.requestState == RequestState.loading && state.requestType == RequestType.pick
                      ? const LoaderVideoCard()
                      : const AddVideoCard(),
                  const VerticalSpace(AppSize.s32),
                ],
              ),
            ),
          ),
        ),
      );
  }
}
