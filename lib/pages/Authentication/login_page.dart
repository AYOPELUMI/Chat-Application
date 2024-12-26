import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:chat_application/main.dart';
import 'package:chat_application/provider/auth_provider.dart';
import 'package:chat_application/res/gap.dart';
import 'package:chat_application/res/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../res/colors.dart';
import '../../res/validators/validators.dart';
import '../../widgets/app_button.dart';
import '../../widgets/auth_text_field.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(8.w),
          alignment: Alignment.center,
          child: ChangeNotifierProvider<AuthProvider>.value(
            value: AuthProvider.instance,
            child: Builder(builder: (context) {
              var _auth = Provider.of<AuthProvider>(context);
              log(_auth.user.toString());
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome back!",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  addVerticalSpacing(12),
                  Text(
                    "Please login to your account",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: ChatifyColors.grey),
                  ),
                  addVerticalSpacing(24),
                  Form(
                      key: _formKey,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: Column(
                        children: [
                          _buildAuthTextField(context,
                              label: 'Email',
                              hintText: 'Email Address',
                              controller: _emailController,
                              validator: AppValidator.validEmail),
                          addVerticalSpacing(6),
                          _buildAuthTextField(context,
                              label: 'Password',
                              hintText: 'Password',
                              isPassword: true,
                              controller: _passwordController,
                              validator: AppValidator.validatePassword),
                          addVerticalSpacing(24),
                          AppButton(
                            onTap: () async {
                              if (_formKey.currentState!.validate()) {
                                HelperFunctions().dismissKeyboard();
                                log("true");
                                _auth.loginUserWithEmailAndPassword(
                                    _emailController.text.trim(),
                                    _passwordController.text.trim(),
                                    context);
                              }
                            },
                            text: "LOGIN",
                            width: 100.w,
                          ),
                          addVerticalSpacing(36),
                          AppButton(
                            onTap: () {},
                            text: "REGISTER",
                            // height: 90,
                            bgColor: Theme.of(context).scaffoldBackgroundColor,
                            textColor: ChatifyColors.grey,
                            borderColor: Colors.transparent,
                            width: 100.w,
                          )
                        ],
                      ))
                ],
              );
            }),
          ),
        ),
      ),
    );
  }

  Widget _buildAuthTextField(BuildContext context,
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

  TextStyle? _labelStyle(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .bodyMedium
        ?.copyWith(fontWeight: FontWeight.w400, fontSize: 14);
  }

  TextStyle? _hintStyle(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .bodyMedium
        ?.copyWith(fontWeight: FontWeight.w400, fontSize: 18);
  }
}
