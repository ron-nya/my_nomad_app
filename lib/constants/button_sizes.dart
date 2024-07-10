import 'package:flutter/widgets.dart';
import 'package:my_app/constants/sizes.dart';

class ButtonSizes {
  final BuildContext context;

  ButtonSizes({required this.context});

  Size getTextButtonSize() {
    final double width = MediaQuery.of(context).size.width * 0.8;
    const double height = Sizes.size48;
    return Size(width, height);
  }
}
