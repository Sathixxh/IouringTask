import 'package:flutter/material.dart';

class CustomTextformfield extends StatelessWidget {
  final String hintText;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final void Function()? onTap;

  const CustomTextformfield(
      {super.key,
      required this.hintText,
      required this.prefixIcon,
      required this.suffixIcon,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
                  hintText: hintText, prefixIcon: prefixIcon, suffixIcon: suffixIcon),
      onTap: onTap,
    );
  }
}