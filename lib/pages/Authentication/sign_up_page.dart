/// The `SignUpPage` is a stateful widget that represents the sign-up page of the chat application.
/// It allows users to create a new account by entering their personal information, such as name, username, email, and password.
/// The page also includes a profile picture upload feature and handles the sign-up process using the provided authentication and database services.
///
/// The `_SignUpPageState` class manages the state of the sign-up page, including the form fields, validation, and the sign-up process.
import 'dart:developer';

import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:chat_application/provider/cloud_storage.dart';
import 'package:chat_application/provider/db_service.dart';
import 'package:chat_application/router/router.gr.dart';
import 'package:chat_application/widgets/sign_up_profile_picture.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';

import '../../provider/auth_provider.dart';
import '../../res/colors.dart';
import '../../res/gap.dart';
import '../../res/helper_functions.dart';
import '../../res/validators/validators.dart';
import '../../widgets/app_button.dart';
import '../../widgets/build_auth_text_field.dart';

@RoutePage()
class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key});

  @override
  ConsumerState<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _auth = ref.watch(authProvider);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(4.w, 10.h, 4.w, 5.h),
          child: Builder(builder: (context) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Let's get going!",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  addVerticalSpacing(12),
                  Text(
                    "Please enter your details",
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
                          SignUpProfilePicture(),
                          buildAuthTextField(context,
                              label: 'Full Name',
                              hintText: 'John Doe',
                              controller: _nameController,
                              validator: AppValidator.validateEmptyText),
                          addVerticalSpacing(6),
                          buildAuthTextField(context,
                              label: 'Username',
                              hintText: 'john_doe',
                              controller: _usernameController,
                              validator: AppValidator.validateEmptyText),
                          addVerticalSpacing(6),
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
                              var imageFile = ref.read(imagePickerProvider);
                              if (_formKey.currentState!.validate() &&
                                  imageFile != null) {
                                HelperFunctions().dismissKeyboard();
                                log("true");
                                ref
                                    .read(authProvider.notifier)
                                    .signUpUserWithEmailAndPassword(
                                        _emailController.text.trim(),
                                        _passwordController.text.trim(),
                                        context, (String uid) async {
                                  if (imageFile != null) {
                                    // var result = await CloudStorageService
                                    //     .instance
                                    //     .uploadFile(uid, File(imageFile.path));
                                    // var imageUrl = result.ref.getDownloadURL();
                                    await DBService.instance.createUserInDB(
                                        uid: uid,
                                        name: _nameController.text.trim(),
                                        username:
                                            _usernameController.text.trim(),
                                        email: _emailController.text.trim(),
                                        imageURL:
                                            "https://i.pravatar.cc/150?img=51");
                                  }
                                });
                              }
                            },
                            text: "REGISTER",
                            width: 100.w,
                          ),
                          addVerticalSpacing(36),
                          AppButton(
                            onTap: () {
                              context.router.replace(LoginRoute());
                            },
                            text: "LOGIN",
                            // height: 90,
                            bgColor: Theme.of(context).scaffoldBackgroundColor,
                            textColor: ChatifyColors.grey,
                            borderColor: Colors.transparent,
                            width: 100.w,
                          )
                        ],
                      ))
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
