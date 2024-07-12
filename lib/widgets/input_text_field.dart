import 'package:flutter/material.dart';
import 'package:my_app/config/theme/app_colors.dart';
import 'package:my_app/constants/sizes.dart';

class InputTextField extends StatefulWidget {
  final String labelText;
  final bool isPassword;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  const InputTextField({
    super.key,
    required this.labelText,
    this.isPassword = false,
    required this.controller,
    this.keyboardType,
    this.validator,
  });

  @override
  State<InputTextField> createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<InputTextField> {
  bool _isObscure = true;

  @override
  void initState() {
    super.initState();
    if (!widget.isPassword) {
      _isObscure = false;
    }
  }

  void _toggleObscure() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _isObscure,
      cursorColor: AppColors.davyGrey,
      validator: widget.validator,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.white,
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _isObscure ? Icons.visibility_off : Icons.visibility,
                  color: Colors.grey,
                ),
                onPressed: _toggleObscure,
              )
            : null,
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
        labelText: widget.labelText,
        labelStyle: Theme.of(context).textTheme.labelMedium,
      ),
    );
  }
}
