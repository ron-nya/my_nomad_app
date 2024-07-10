import 'package:flutter/material.dart';
import 'package:my_app/config/theme/app_colors.dart';
import 'package:my_app/constants/sizes.dart';

class InputTextField extends StatelessWidget {
  final String labelText;
  const InputTextField({
    super.key,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: AppColors.davyGrey,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.white,
        contentPadding: const EdgeInsets.all(Sizes.size10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Sizes.size8),
          borderSide: const BorderSide(
            color: AppColors.davyGrey,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.glaucous,
          ),
        ),
        labelText: labelText,
        labelStyle: Theme.of(context).textTheme.labelMedium,
      ),
    );
  }
}
