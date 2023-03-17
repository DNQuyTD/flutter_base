import 'package:flutter/material.dart';

class PasswordFormField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final FormFieldValidator<String> validator;
  final String? initialValue;
  final FocusNode? nextFocusNode;
  final FocusNode? focusNode;
  final TextEditingController? controller;

  const PasswordFormField(
      {Key? key,
        required this.onChanged,
        required this.validator,
        this.initialValue,
        this.nextFocusNode,
        this.focusNode,
        this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      onFieldSubmitted: (_) => nextFocusNode?.requestFocus(),
      initialValue: initialValue,
      obscureText: true,
      keyboardType: TextInputType.text,
      validator: validator,
      onChanged: onChanged,
      autofocus: true,
      controller: controller,
      decoration: const InputDecoration(
          icon: Icon(Icons.security),
          hintText: 'Password'),
    );
  }
}