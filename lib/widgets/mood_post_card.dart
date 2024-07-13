import 'package:flutter/material.dart';
import 'package:my_app/constants/gaps.dart';
import 'package:my_app/constants/sizes.dart';
import 'package:my_app/features/home/models/mood_post_card_model.dart';
import 'package:my_app/features/home/models/mood_status.dart';
import 'package:my_app/utils/app_date_util.dart';

class MoodPostCard extends StatelessWidget {
  final MoodPostCardModel moodPostCardModel;

  const MoodPostCard({
    super.key,
    required this.moodPostCardModel,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Sizes.size8),
            ),
            color: Theme.of(context).cardColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size20,
                vertical: Sizes.size8,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Mood: ${MoodStatus.getMoodEmoji(moodPostCardModel.mood)}',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Gaps.v2,
                  Text(
                    moodPostCardModel.content,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ),
          Gaps.v2,
          Row(
            children: [
              Gaps.h10,
              Text(
                AppDateUtil.getFormattedTimeDiffrence(
                    moodPostCardModel.createDttm),
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
