import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:chat_application/provider/auth_provider.dart';
import 'package:chat_application/res/gap.dart';
import 'package:chat_application/res/helper_functions.dart';
import 'package:chat_application/router/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';

import '../../res/colors.dart';
import '../../res/validators/validators.dart';
import '../../widgets/app_button.dart';
import '../../widgets/build_auth_text_field.dart';

@RoutePage()
class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final _auth = ref.watch(authProvider);
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(8.w),
          alignment: Alignment.center,
          child: Builder(builder: (context) {
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
                        buildAuthTextField(context,
                            label: 'Email',
                            hintText: 'Email Address',
                            controller: _emailController,
                            validator: AppValidator.validEmail),
                        addVerticalSpacing(6),
                        buildAuthTextField(context,
                            label: 'Password',
                            hintText: 'Password',
                            isPassword: true,
                            controller: _passwordController,
                            validator: AppValidator.validatePassword),
                        addVerticalSpacing(24),
                        AppButton(
                          loading: ref.watch(authProvider.notifier).status ==
                              AuthStatus.authenticating,
                          onTap: () async {
                            if (_formKey.currentState!.validate()) {
                              HelperFunctions().dismissKeyboard();
                              log("true");
                              ref
                                  .read(authProvider.notifier)
                                  .loginUserWithEmailAndPassword(
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
                          onTap: () {
                            context.router.replace(SignUpRoute());
                          },
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
    );
  }
}
