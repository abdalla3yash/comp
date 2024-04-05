import 'package:comp/config/theme/colors.dart';
import 'package:comp/core/view/widgets/custom_button.dart';
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
        
            Container(
                height: 200,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: AppColors.lightGrey,
                    borderRadius: BorderRadius.circular(24)),
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        image: DecorationImage(
                          image: NetworkImage('https://images.pexels.com/photos/45201/kitty-cat-kitten-pet-45201.jpeg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox.fromSize(size: Size.fromWidth(8),),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.45,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                      SizedBox.fromSize(size: Size.fromHeight(8),),
                          SizedBox(
                            width:MediaQuery.of(context).size.width * 0.45,
                            child: Text(
                              'videoName.mp4',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.45,
                            child: Text(
                              'Original Size: 360.42 MB',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.45,
                            child: Text(
                              'Compressed Size: 24.03 MB',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.45,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CustomButton(
                                  borderRadius: 8,
                                  color: AppColors.primary,
                                  text: "View",
                                  height: 32,
                                  onPressed: () => null
                                ),
                                CustomButton(
                                  borderRadius: 8,
                                  color: AppColors.secondary,
                                  text: "Upload",
                                  height: 32,
                                  onPressed: () => null,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
