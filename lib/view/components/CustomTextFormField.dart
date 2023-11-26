import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final Widget prefixIcon;
  final TextEditingController? controller;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;

  const CustomTextFormField({
    Key? key,
    required this.labelText,
    required this.prefixIcon,
    required this.controller,
    required this.onSaved,
    required this.validator,
    required bool obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: prefixIcon,
      ),
      keyboardType: TextInputType.emailAddress,
      validator: validator,
    );
  }
}
