import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  final String? hintText;
  final IconData? suffixIcon;
  final bool isPassword;
  final TextEditingController controller;
  String? Function(String?)? validat;
  CustomTextField({
    super.key,
    this.hintText,
    this.suffixIcon,
    this.isPassword = false,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric( vertical: 27, horizontal: 20),
          filled: true,
          fillColor: Colors.transparent,
          hintText: hintText,
          suffixIcon: Icon(suffixIcon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(
              color: Colors.white,
            ),
        ),)
      ),
    );
  }
}
