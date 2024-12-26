import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';

import '../../../res/ui_constants.dart';
import '../res/colors.dart';

class ChatifyTextField extends ConsumerStatefulWidget {
  final String? label;
  final int? minLines;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String? hintText;
  final TextInputFormatter? formatter;
  final TextCapitalization? textCapitalization;
  final Function(String)? onChanged;
  final Function(String?)? onSaved;
  final Function()? onTap;
  final int? maxLength;
  final TextEditingController? controller;
  final Function(String?, String?) validator;
  final bool shouldReadOnly;
  final double? minWidth;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextStyle? labelStyle;
  final bool enabled;
  final TextStyle? hintStyle;
  final FocusNode? focusNode;
  final int? maxLines;
  final TextInputAction? textInputAction;
  final bool isDescription;
  final bool exemptFromValdation;

  /// formats the textfeild to a password version
  final bool isPassword;

  const ChatifyTextField(
      {super.key,
      this.label,
      this.minLines,
      this.onChanged,
      this.onTap,
      this.keyboardType,
      this.formatter,
      this.onSaved,
      this.obscureText = false,
      this.hintText,
      this.maxLength,
      this.controller,
      required this.validator,
      this.textCapitalization,
      this.shouldReadOnly = false,
      trailing,
      this.suffixIcon,
      this.enabled = true,
      this.minWidth,
      this.prefixIcon,
      this.labelStyle,
      this.hintStyle,
      this.focusNode,
      this.isPassword = false,
      this.maxLines = 1,
      this.textInputAction,
      this.exemptFromValdation = false,
      this.isDescription = false});

  @override
  ConsumerState<ChatifyTextField> createState() =>
      _VWidgetsLoginTextFieldState();
}

class _VWidgetsLoginTextFieldState extends ConsumerState<ChatifyTextField> {
  FocusNode? focusNodeZZZ;
  String? errorMessage;

  late bool obscureText = widget.isPassword;

  @override
  void initState() {
    if (widget.focusNode == null) {
      focusNodeZZZ = FocusNode();
      focusNodeZZZ?.addListener(addListenerToFocusNode);
    } else {
      widget.focusNode?.addListener(addListenerToFocusNodeWidget);
    }
    super.initState();
  }

  void addListenerToFocusNode() async {
    setState(() {});
  }

  void addListenerToFocusNodeWidget() async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    bool showGradient =
        widget.focusNode?.hasFocus ?? focusNodeZZZ?.hasFocus ?? false;
    return Column(children: [
      Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        // constraints: BoxConstraints(
        //   minHeight: widget.minLines != null ? widget.minLines! * 20.0 : 50.0,
        //   maxHeight: widget.minLines != null ? double.infinity : 50.0,
        // ),
        child: GestureDetector(
          onTap: widget.onTap,
          child: Container(
            // height: maxLength != null ? 6.h : 6.h,
            width: widget.minWidth ?? 100.0.w,

            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            child: TextFormField(
              textInputAction: widget.textInputAction,

              autocorrect: false,
              enableSuggestions: false,
              minLines: widget.minLines ?? 1,
              controller: widget.controller,
              maxLength: widget.maxLength,
              maxLines: widget.maxLines,
              onSaved: widget.onSaved,
              enabled: widget.enabled,
              cursorHeight: 15,
              textCapitalization:
                  widget.textCapitalization ?? TextCapitalization.none,

              focusNode: widget.focusNode ?? focusNodeZZZ,
              onChanged: (text) {
                if (widget.onChanged != null) widget.onChanged!(text);
              },
              cursorColor: Theme.of(context).primaryColor,
              keyboardType: widget.keyboardType,
              obscureText: obscureText,
              obscuringCharacter: '*',
              inputFormatters: widget.isDescription
                  ? []
                  : [
                      widget.formatter ??
                          FilteringTextInputFormatter.singleLineFormatter
                    ],
              // onFieldSubmitted: (value) {
              //   if (widget.textInputAction != TextInputAction.newline) {
              //     widget.focusNode?.unfocus();
              //     focusNodeZZZ?.unfocus();
              //   }
              // },
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                return !widget.exemptFromValdation
                    ? widget.validator(widget.label, value)
                    : null;
              },
              // validator: (val) {
              //   if (widget.validator == null) return;
              //   if (val == null || val.isEmpty) {
              //     // errorMessage = 'Enter text';
              //   } else {
              //     errorMessage = widget.validator != null ? widget.validator!(val) : 'Enter text';
              //   }

              //   WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((_) {
              //     setState(() {});
              //   });
              //   return null;
              // },
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 12.sp,
                  ),
              readOnly: widget.shouldReadOnly,
              decoration: UIConstants.instance
                  .inputDecoration(
                    labelText: widget.label,
                    labelStyle: widget.labelStyle,
                    context,
                    hasFocus: widget.focusNode?.hasFocus ??
                        focusNodeZZZ?.hasFocus ??
                        false,
                    hintText: widget.hintText,
                    suffixIcon: widget.suffixIcon,
                    contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 16),
                  )
                  .copyWith(
                    focusedBorder: showGradient
                        ? UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: ChatifyColors.primaryColor, width: 1.25),
                          )
                        : null,
                    suffixIcon: !widget.isPassword
                        ? widget.suffixIcon
                        : IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () =>
                                setState(() => obscureText = !obscureText),
                            icon: Icon(
                              obscureText
                                  ? Icons.visibility_rounded
                                  : Icons.visibility_off_rounded,
                            ),
                          ),
                  ),
            ),
          ),
        ),
      ),
      if (errorMessage != null && errorMessage!.isNotEmpty)
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "$errorMessage",
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.error,
                ),
          ),
        )
    ]);
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: capitalize(newValue.text),
      selection: newValue.selection,
    );
  }
}

String capitalize(String value) {
  if (value.trim().isEmpty) return "";
  return "${value[0].toUpperCase()}${value.substring(1).toLowerCase()}";
}
