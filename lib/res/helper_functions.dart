import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:sizer/sizer.dart';

import 'gap.dart';

class HelperFunctions {
  static BuildContext? context;

  // //TODO: to work with this colors later
  // switch (responseEnum) {
  // case ResponseEnum.sucesss:
  // return VmodelColors.primaryColor;
  // case ResponseEnum.failed:
  // return VmodelColors.error.withOpacity(0.3);
  // case ResponseEnum.warning:
  // return VmodelColors.primaryColor.withOpacity(0.3);
  // default:
  // return VmodelColors.primaryColor;
  // }

  static showToast({
    required String message,
    bool isSuccess = false,
    String? svgPath,
    bool fromTop = false,
    Color? backgroundColor,
    bool isWarning = false,
  }) {
    showToastWidget(
      Container(
        height: 50,
        padding: EdgeInsets.all(08),
        width: 95.w,
        decoration: BoxDecoration(
          color: backgroundColor ??
              Theme.of(context!).buttonTheme.colorScheme?.surface,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(children: [
          addHorizontalSpacing(5),
          Expanded(
            child: Text(
              message,
              style: Theme.of(context!).textTheme.bodyMedium!.copyWith(
                    color:
                        Theme.of(context!).buttonTheme.colorScheme!.onPrimary,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
              // maxLines: 1,
              overflow: TextOverflow.clip,
            ),
          ),
          addHorizontalSpacing(5),
          if (isSuccess)
            Icon(
              Icons.check_circle_outline_sharp,
              size: 20,
            )
        ]),
      ),
      context: context,
      animation: StyledToastAnimation.scale,
      reverseAnimation: StyledToastAnimation.fade,
      position: StyledToastPosition.bottom,
      dismissOtherToast: true,
      animDuration: const Duration(milliseconds: 800),
      duration: const Duration(seconds: 3),
      curve: Curves.elasticOut,
      reverseCurve: Curves.bounceIn,
    );
  }

  void dismissKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
