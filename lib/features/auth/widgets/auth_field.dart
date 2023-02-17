// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:twitter_clone/utils/theme.dart';

class AuthField extends StatelessWidget {
  final TextEditingController controller;
  final String text;
  const AuthField({
    Key? key,
    required this.controller,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: text,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: AppColors.blueColor, width: 3),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: AppColors.greyColor, width: 1.3),
        ),
        contentPadding: const EdgeInsets.all(22),
        hintStyle: const TextStyle(
          fontSize: 18,
        ),
      ),
    );
  }
}
