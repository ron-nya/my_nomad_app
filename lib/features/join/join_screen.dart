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
  State<JoinScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<JoinScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    // 간단한 이메일 패턴 검증
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    return null;
  }

  void _submitForm(String path) {
    if (_formKey.currentState!.validate()) {
      context.go(path);
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: _formKey,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaIcon(
                  FontAwesomeIcons.fire,
                  color: Theme.of(context).primaryColor,
                ),
                Gaps.h12,
                Text(
                  'MOOD',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Gaps.h12,
                FaIcon(
                  FontAwesomeIcons.fire,
                  color: Theme.of(context).primaryColor,
                ),
              ],
            ),
          ),
          body: CommonPadding(
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
                    InputTextField(
                      labelText: 'Email',
                      controller: _emailController,
                      validator: _validateEmail,
                    ),
                    Gaps.v24,
                    InputTextField(
                      labelText: 'Password',
                      isPassword: true,
                      controller: _passwordController,
                      validator: _validatePassword,
                    ),
                    Gaps.v48,
                    PostButton(
                      buttonText: 'Create Account',
                      onPressed: () => _submitForm('/login'),
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
                      buttonText: 'Log in →',
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
