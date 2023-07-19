// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final int? maxLines;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final bool? enable;
  final TextInputType? textKeyboardType;
  final Widget? prefixIcon;
  final Widget? sufixIcon;
  final bool obscurText;
  final String? dateMask;
  const CustomTextField({
    Key? key,
    @required this.hintText,
    this.textKeyboardType,
    this.onChanged,
    this.maxLines,
    this.enable,
    this.prefixIcon,
    this.sufixIcon,
    this.obscurText = false,
    @required this.controller,
    this.validator,
    this.dateMask,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final dateMaskFormatter = MaskTextInputFormatter(mask: dateMask);
    return TextFormField(
      style: const TextStyle(color: Colors.black),
      onChanged: onChanged,
      enabled: enable,
      // autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      keyboardType: textKeyboardType,
      controller: controller,
      obscureText: obscurText,
      textInputAction: TextInputAction.done,

      // maxLines: maxLines == null ? null : maxLines,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: sufixIcon,
        isDense: true,
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.black),
      ),
    );
  }
}
