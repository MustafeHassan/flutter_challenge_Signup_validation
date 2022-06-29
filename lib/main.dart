import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

import 'constants/constants.dart';
import 'sign_up.dart';

void main() {
  runApp(DevicePreview(
      enabled: true, builder: (context) => const SignUpValidation()));
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  //* Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

class SignUpValidation extends StatelessWidget {
  const SignUpValidation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: MyCustomScrollBehavior(),
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'SignUp Validation Form',
      theme: theme,
      debugShowCheckedModeBanner: false,
      home: const SignUp(),
    );
  }
}
