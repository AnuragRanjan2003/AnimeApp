import 'package:flutter/material.dart';

class OutlineTextInput extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final bool obscureText;
  const OutlineTextInput({super.key, required this.hint, required this.controller, this.obscureText = false });

  @override
  Widget build(BuildContext context) {
    return  TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hint,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        )
      ),
    );
  }
}
