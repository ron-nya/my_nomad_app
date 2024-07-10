import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:my_app/config/theme/app_colors.dart';
import 'package:my_app/constants/gaps.dart';
import 'package:my_app/constants/sizes.dart';
import 'package:my_app/widgets/common_padding.dart';
import 'package:my_app/widgets/input_text_field.dart';
import 'package:my_app/widgets/post_button.dart';

class JoinScreen extends StatefulWidget {
  const JoinScreen({super.key});

  @override
  State<JoinScreen> createState() => _JoinScreenState();
}

class _JoinScreenState extends State<JoinScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const FaIcon(
                FontAwesomeIcons.fire,
                color: AppColors.indianRed,
              ),
              Gaps.h12,
              Text(
                'MOOD',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Gaps.h12,
              const FaIcon(
                FontAwesomeIcons.fire,
                color: AppColors.indianRed,
              ),
            ],
          ),
        ),
        body: CommonPadding(
          child: Center(
            child: Stack(
              children: [
                Column(
                  children: [
                    Gaps.v192,
                    Text(
                      'Join!',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Gaps.v48,
                    const InputTextField(
                      labelText: 'Email',
                    ),
                    Gaps.v24,
                    const InputTextField(
                      labelText: 'Password',
                    ),
                    Gaps.v24,
                    PostButton(
                      buttonText: 'Create Account',
                      onPressed: () => context.go('/home'),
                    ),
                  ],
                ),
                Positioned(
                  bottom: Sizes.size48,
                  left: 0,
                  right: 0,
                  child: Align(
                    alignment: Alignment.center,
                    child: PostButton(
                      buttonText: 'Log in',
                      onPressed: () => context.go('/login'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
