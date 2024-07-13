import 'package:flutter/material.dart';
import 'package:my_app/constants/sizes.dart';
import 'package:my_app/features/home/models/mood_status.dart';

class MoodBox extends StatelessWidget {
  final Mood mood;
  final bool isSelected;

  const MoodBox({
    super.key,
    required this.mood,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected
            ? Theme.of(context).primaryColor
            : Theme.of(context).canvasColor,
        borderRadius: BorderRadius.circular(Sizes.size8),
        border: isSelected
            ? Border.all(
                width: Sizes.size1,
              )
            : null,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor,
            blurRadius: Sizes.size3,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(Sizes.size2),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            MoodStatus.getMoodEmoji(mood.name),
          ),
        ),
      ),
    );
  }
}
