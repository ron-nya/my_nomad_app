import 'package:flutter/material.dart';
import 'package:my_app/constants/sizes.dart';

class CommonPadding extends StatelessWidget {
  final Widget child;

  const CommonPadding({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.size16),
      child: child,
    );
  }
}
