import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_app/constants/gaps.dart';
import 'package:my_app/constants/sizes.dart';
import 'package:my_app/features/main/main_screen.dart';
import 'package:my_app/features/login/view_models/login_view_model.dart';
import 'package:my_app/widgets/common_appbar.dart';
import 'package:my_app/widgets/common_padding.dart';
import 'package:my_app/widgets/input_text_field.dart';
import 'package:my_app/widgets/post_button.dart';

class LoginScreen extends ConsumerStatefulWidget {
  static String routeUrl = '/login';
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
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
    ref.read(loginProvider.notifier).login(
          _emailController.text,
          _passwordController.text,
          context,
        );
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
          appBar: const CommonAppbar(),
          body: CommonPadding(
            child: Stack(
              children: [
                Column(
                  children: [
                    Gaps.v192,
                    Text(
                      'Welcome!',
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
                      buttonText: 'Enter',
                      onPressed: () => _submitForm(
                        MainScreen.routeUrl,
                      ),
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
                      buttonText: 'Create an account →',
                      onPressed: () => context.go('/join'),
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
