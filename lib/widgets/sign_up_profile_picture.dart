import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

import '../res/colors.dart';
import '../res/images.dart';
import 'bottom_sheet.dart';

final imagePickerProvider = StateProvider<XFile?>((ref) => null);

class SignUpProfilePicture extends ConsumerStatefulWidget {
  const SignUpProfilePicture({super.key});

  @override
  ConsumerState<SignUpProfilePicture> createState() =>
      _SignUpProfilePictureState();
}

class _SignUpProfilePictureState extends ConsumerState<SignUpProfilePicture> {
  @override
  Widget build(BuildContext context) {
    final imageFile = ref.watch(imagePickerProvider);
    return Stack(
      children: [
        GestureDetector(
            onTap: () {
              ChatifyBottomSheetComponent.actionBottomSheet(
                context: context,
                actions: [
                  ChatifyBottomSheetItem(
                      onTap: () async {
                        Navigator.pop(context);
                        final photo = await ImagePicker()
                            .pickImage(source: ImageSource.gallery);

                        if (photo == null) return;
                        ref.read(imagePickerProvider.notifier).state = photo;
                      },
                      title: 'Gallery'),
                  ChatifyBottomSheetItem(
                      onTap: () async {
                        Navigator.pop(context);
                        final photo = await ImagePicker()
                            .pickImage(source: ImageSource.camera);

                        if (photo == null) return;
                        ref.read(imagePickerProvider.notifier).state = photo;
                      },
                      title: 'Camera'),
                ],
              );
            },
            child: CircleAvatar(
                radius: 50,
                backgroundColor:
                    Colors.white, // Background color when the image is loading
                child: ClipOval(
                    child: imageFile != null
                        ? Image.file(
                            File(imageFile.path),
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          )
                        : SvgPicture.asset(
                            AppSvgs.avatarSvg,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          )))),
        Positioned(
          bottom: 0,
          right: 10,
          child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: ChatifyColors.primaryColor,
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(
                AppSvgs.cameraSvg,
                width: 10,
                height: 10,
                fit: BoxFit.cover,
              )),
        ),
      ],
    );
  }
}
