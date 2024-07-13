import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_app/constants/gaps.dart';
import 'package:my_app/constants/sizes.dart';
import 'package:my_app/features/join/view_models/join_view_model.dart';
import 'package:my_app/widgets/common_appbar.dart';
import 'package:my_app/widgets/common_padding.dart';
import 'package:my_app/widgets/input_text_field.dart';
import 'package:my_app/widgets/post_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class JoinScreen extends ConsumerStatefulWidget {
  static String routeUrl = '/join';
  const JoinScreen({super.key});

  @override
  ConsumerState<JoinScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<JoinScreen> {
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

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      ref.read(joinForm.notifier).state = {
        "email": _emailController.text,
        "password": _passwordController.text,
      };
      try {
        await ref.read(joinProvider.notifier).join();
        if (mounted) {
          context.go('/login');
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Join failed: $e')),
          );
        }
      }
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
          appBar: const CommonAppbar(),
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
                      onPressed: () => _submitForm(),
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
