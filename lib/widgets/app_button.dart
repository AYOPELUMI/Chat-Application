import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../res/colors.dart';

class AppButton extends StatelessWidget {
  const AppButton(
      {super.key,
      this.text = "text",
      this.width,
      required this.onTap,
      this.height,
      this.fontSize,
      this.textColor,
      this.bgColor,
      this.isDisabled = false,
      this.borderColor = ChatifyColors.activeColor,
      this.textWidget,
      this.fontWeight = FontWeight.w400,
      this.loading = false,
      this.centerText = false});

  final Color? textColor;
  final Color? bgColor;
  final Color borderColor;
  final String? text;
  final Widget? textWidget;
  final double? width;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? height;
  final void Function()? onTap;
  final bool isDisabled;
  final bool loading;
  final bool centerText;
  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return GestureDetector(
      onTap: isDisabled
          ? null
          : loading
              ? null
              : onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
        decoration: BoxDecoration(
          border: Border.all(
              width: bgColor != null ? 1 : 0,
              color: bgColor == null
                  ? borderColor ?? Colors.transparent
                  : borderColor),
          borderRadius: BorderRadius.circular(8),
          color: isDisabled
              ? ChatifyColors.activeColor.withOpacity(0.2)
              : bgColor ?? ChatifyColors.activeColor,
        ),
        height: height ?? 50,
        width: width,
        child: loading
            ? Center(
                child: SizedBox(
                  height: 20, // Set the height to ensure a circle
                  width: 20, // Set the width to ensure a circle
                  child: CircularProgressIndicator(
                    strokeWidth: 2, // Adjust for a thinner or thicker circle
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.white, // Change to your desired color
                    ),
                  ),
                ),
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: textWidget != null
                    ? centerText == true
                        ? MainAxisAlignment.center
                        : MainAxisAlignment.start
                    : MainAxisAlignment.center,
                children: [
                  textWidget ?? const SizedBox.shrink(),
                  textWidget != null
                      ? Text(
                          text!,
                          style: TextStyle(
                            fontSize: fontSize ?? 10.sp,
                            color: textColor ??
                                (isDarkMode
                                    ? isDisabled
                                        ? ChatifyColors.white.withOpacity(0.5)
                                        : ChatifyColors.white
                                    : bgColor != null
                                        ? ChatifyColors.activeColor
                                        : ChatifyColors.white),
                            fontWeight: FontWeight.w800,
                          ),
                        )
                      : Center(
                          child: Text(
                            text!,
                            style: TextStyle(
                              fontSize: fontSize ?? 10.sp,
                              color: textColor ??
                                  (isDarkMode
                                      ? isDisabled
                                          ? ChatifyColors.white.withOpacity(0.5)
                                          : ChatifyColors.white
                                      : bgColor != null
                                          ? ChatifyColors.activeColor
                                          : ChatifyColors.white),
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                ],
              ),
      ),
    );
  }
}
