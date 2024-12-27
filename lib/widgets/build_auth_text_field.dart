import 'package:flutter/material.dart';

import 'auth_text_field.dart';

Widget buildAuthTextField(BuildContext context,
    {required String label,
    required String hintText,
    void Function(String)? onChanged,
    TextEditingController? controller,
    bool enabled = true,
    int? minLines,
    int? maxLength,
    int maxLines = 1,
    required Function(String?, String?) validator,
    TextInputAction? textInputAction = TextInputAction.done,
    TextInputType? keyboardType = TextInputType.text,
    bool isPassword = false}) {
  return ChatifyTextField(
    label: label,
    // hintText: hintText,
    onChanged: onChanged,
    controller: controller,
    enabled: enabled,
    minLines: minLines,
    maxLength: maxLength,
    maxLines: maxLines,
    textInputAction: textInputAction,
    keyboardType: keyboardType,
    isPassword: isPassword,
    validator: validator,
  );
}
