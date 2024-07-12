import 'package:flutter/material.dart';
import 'package:my_app/config/theme/app_colors.dart';
import 'package:my_app/constants/button_sizes.dart';

class PostButton extends StatelessWidget {
  final String buttonText;
  final void Function()? onPressed;
  final bool isEnabled;

  const PostButton({
    super.key,
    required this.buttonText,
    this.onPressed,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    ButtonSizes buttonSizes = ButtonSizes(context: context);
    Size buttonSize = buttonSizes.getTextButtonSize();
    return SizedBox(
      width: buttonSize.width,
      height: buttonSize.height,
      child: TextButton(
        onPressed: isEnabled ? onPressed : null,
        style: isEnabled
            ? null
            : TextButton.styleFrom(
                backgroundColor: Theme.of(context).unselectedWidgetColor,
              ),
        child: Text(
          buttonText,
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(color: AppColors.white),
        ),
      ),
    );
  }
}
