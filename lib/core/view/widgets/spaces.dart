import 'package:flutter/material.dart';

class VerticalSpace extends StatelessWidget {
  final double height;
  final bool isSliver;

  const VerticalSpace(this.height, {super.key}) : isSliver = false;

  const VerticalSpace.sliver(this.height, {super.key}) : isSliver = true;

  @override
  Widget build(BuildContext context) {
    return isSliver ? SliverToBoxAdapter(child: SizedBox(height: height)) : SizedBox(height: height);
  }
}

class HorizontalSpace extends StatelessWidget {
  final double width;
  final bool isSliver;

  const HorizontalSpace(this.width, {super.key}) : isSliver = false;

  const HorizontalSpace.sliver(this.width, {super.key}) : isSliver = true;

  @override
  Widget build(BuildContext context) {
    return isSliver ? SliverToBoxAdapter(child: SizedBox(width: width)) : SizedBox(width: width);
  }
}
