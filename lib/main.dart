import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

import 'login.dart';
import 'text_form.dart';

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
      theme: ThemeData(
        fontFamily: 'Inter',
      ),
      debugShowCheckedModeBanner: false,
      home: const SignUp(),
    );
  }
}

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController controller = TextEditingController();
  List<String> opinion = ['Flutter is greate!', 'Flutter is awesome', 'Other'];
  int selectedOpinion = 0;
  bool isCheckBoxChecked = false;
  bool isPasswordShown = true;
  String formatedDate = '';
  List<String> monthList = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'Ocober',
    'November',
    'December',
  ];
  void yMMMMdDateFromate(String stringDateTime) {
    DateTime dateTime = DateTime.parse(stringDateTime);
    String dateTimeyMMMMdDateFromate =
        '${monthList[dateTime.month - 1]} ${dateTime.day}, ${dateTime.year} ';
    formatedDate = dateTimeyMMMMdDateFromate;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        title: const Text(
          "Sign Up",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              const TextForm(
                hintText: 'Name',
                isObsecureText: false,
              ),
              const TextForm(
                hintText: 'Email',
                isObsecureText: false,
              ),
              TextForm(
                  hintText: 'Password',
                  isPasswordField: true,
                  isObsecureText: isPasswordShown,
                  showPassord: () {
                    setState(() {
                      isPasswordShown = !isPasswordShown;
                    });
                  }),
              TextForm(
                  hintText: 'Password again',
                  isPasswordField: true,
                  isObsecureText: isPasswordShown,
                  showPassord: () {
                    setState(() {
                      isPasswordShown = !isPasswordShown;
                    });
                  }),
              TextForm(
                hintText: 'Date of birth',
                controller: controller,
                isDateOfBirthField: true,
                isObsecureText: false,
                getDate: () {
                  showCupertinoModalPopup(
                      context: context,
                      builder: (context) {
                        return SizedBox(
                          width: double.infinity,
                          height: 300,
                          child: GestureDetector(
                            onTap: () => Navigator.of(context).pop(),
                            child: CupertinoDatePicker(
                              backgroundColor: Colors.white,
                              mode: CupertinoDatePickerMode.date,
                              initialDateTime: DateTime.now(),
                              onDateTimeChanged: (newDate) {
                                setState(() {
                                  yMMMMdDateFromate(newDate.toString());
                                  controller.value =
                                      TextEditingValue(text: formatedDate);
                                });
                              },
                            ),
                          ),
                        );
                      });
                },
              ),
              ...List.generate(opinion.length, (index) {
                return SizedBox(
                  height: 30,
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Radio(
                        activeColor: const Color(0xff5DB075),
                        focusColor: const Color(0xffBDBDBD),
                        value: index,
                        groupValue: selectedOpinion,
                        onChanged: (newValue) {
                          setState(() {
                            selectedOpinion = index;
                          });
                        },
                      ),
                      Text(
                        opinion[index],
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                );
              }),
              const SizedBox(
                height: 16.0,
              ),
              Visibility(
                visible: selectedOpinion == 2 ? true : false,
                child: const TextForm(hintText: 'Other'),
              ),
              const SizedBox(height: 38),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Transform.scale(
                    scale: 1.2,
                    child: Checkbox(
                      activeColor: const Color(0xff5DB075),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      value: isCheckBoxChecked,
                      onChanged: (newValue) {
                        setState(() {
                          isCheckBoxChecked = newValue!;
                        });
                      },
                    ),
                  ),
                  const Expanded(
                    child: Text(
                      "I would like to receive your newsletter and other \n promotional information.",
                      style: TextStyle(
                        color: Color(0xff666666),
                        fontWeight: FontWeight.w400,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                child: CupertinoButton(
                  color: const Color(0xff5DB075),
                  borderRadius: BorderRadius.circular(100),
                  padding: const EdgeInsets.all(16),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Login(),
                    ));
                  },
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: CupertinoButton(
                  onPressed: () {},
                  child: const Text(
                    'Forgot your password?',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Color(0xff5DB075),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
