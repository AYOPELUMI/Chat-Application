import 'package:chat_application/pages/Authentication/login_page.dart';
import 'package:chat_application/res/theme.dart';
import 'package:chat_application/router/router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final router = AppRouter();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder:
        (BuildContext context, Orientation orientation, DeviceType deviceType) {
      return MaterialApp.router(
        title: 'Chatify',
        debugShowCheckedModeBanner: false,
        theme: CHatifyTheme.lightMode,
        darkTheme: CHatifyTheme.darkTheme,
        routerConfig: router.config(
          navigatorObservers: () => [MyObserver()],
        ),
      );
    });
  }
}
