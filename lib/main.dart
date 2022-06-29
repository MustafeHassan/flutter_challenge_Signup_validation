import 'package:flutter/material.dart';

import 'constants/constants.dart';
import 'sign_up.dart';

void main() {
  runApp(const SignUpValidation());
}

class SignUpValidation extends StatelessWidget {
  const SignUpValidation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SignUp Validation Form',
      theme: theme,
      debugShowCheckedModeBanner: false,
      home: const SignUp(),
    );
  }
}
