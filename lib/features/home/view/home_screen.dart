import 'package:comp/features/home/widgets/add_video_card.dart';
import 'package:comp/features/home/widgets/video_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('COMP.'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            VideoCard(),
            SizedBox.fromSize(
              size: Size.fromHeight(12),
            ),
            VideoCard(),
            SizedBox.fromSize(
              size: Size.fromHeight(12),
            ),
            AddVideoCard()
          ],
        ),
      ),
    );
  }
}
