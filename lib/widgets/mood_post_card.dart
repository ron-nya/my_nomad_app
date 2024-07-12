import 'package:flutter/material.dart';
import 'package:my_app/constants/sizes.dart';
import 'package:my_app/features/home/models/mood_post_card_model.dart';

class MoodPostCard extends StatelessWidget {
  final MoodPostCardModel moodPostCardModel;

  const MoodPostCard({
    super.key,
    required this.moodPostCardModel,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Sizes.size8),
      ),
      margin: const EdgeInsets.all(16.0),
      color: Theme.of(context).cardColor,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'hello',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
        ],
      ),
    );
  }
}
