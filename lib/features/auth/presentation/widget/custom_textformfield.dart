import 'package:cashier_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String hintText;
  final bool obscureText;
  final Icon? icon;
  final Widget? suffixIcon;
  const CustomTextFormField(
      {super.key,
      this.controller,
      this.keyboardType,
      required this.hintText,
      this.obscureText = false,
      this.icon,
      this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 50,
      decoration: BoxDecoration(
          border: Border.all(
              color: const Color.fromARGB(255, 116, 119, 122).withOpacity(0.5)),
          borderRadius: BorderRadius.circular(9)),
      child: Center(
        child: TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          decoration: InputDecoration(
            icon: icon,
            suffixIcon: suffixIcon,
            hintText: hintText,
            hintStyle: TextStyle(
              color: const Color.fromARGB(255, 114, 117, 120).withOpacity(0.5),
              fontSize: 14,
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
