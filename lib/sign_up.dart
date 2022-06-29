import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'constants/constants.dart';
import 'constants/form_group.dart';
import 'login.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  //* Varaibles
  static int selectedOpinion = 0;
  bool isObsecure = true;
  String formatedDate = '';

//* Methods
  void showPassword() {
    setState(() {
      isObsecure = !isObsecure;
    });
  }

  void _onSubmit() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const Login(),
    ));
  }

  void showDatePciker() {
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
                  var year = newDate.year;
                  var month = newDate.month;
                  var day = newDate.day;

                  setState(() {
                    if (newDate.month <= 9) {
                      if (newDate.day <= 9) {
                        formatedDate = '$year-0$month-0$day';
                        formGroup.control('DateOfBirth').value = formatedDate;
                      }
                      formatedDate = '$year-0$month-$day';
                      formGroup.control('DateOfBirth').value = formatedDate;
                    } else {
                      formatedDate = '$year-$month-$day';
                      formGroup.control('DateOfBirth').value = formatedDate;
                    }
                  });
                },
              ),
            ),
          );
        });
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
          child: ReactiveForm(
            formGroup: formGroup,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                ReactiveTextField(
                  formControlName: 'Name',
                  validationMessages: (controller) {
                    return {'required': 'This field is required'};
                  },
                  decoration: const InputDecoration(
                    hintText: 'Name',
                  ),
                  cursorColor: const Color(0xff5DB075),
                ),
                const SizedBox(height: 16),
                ReactiveTextField(
                  formControlName: 'Email',
                  validationMessages: (controller) {
                    return {
                      'required': 'This field is required',
                      'email': 'This is not a valid email',
                    };
                  },
                  decoration: const InputDecoration(
                    hintText: 'Email',
                  ),
                  cursorColor: const Color(0xff5DB075),
                ),
                const SizedBox(height: 16),
                ReactiveTextField(
                  formControlName: 'Password',
                  validationMessages: (controller) {
                    return {
                      'required': 'This field is required',
                      'minLength': 'The password must be 8 charecters at least',
                      'pattern':
                          'The password must contain at least a lowercase\n, an uppercase letter, a number and a symbol.'
                    };
                  },
                  decoration: InputDecoration(
                    hintText: 'Password',
                    suffixIcon: InkWell(
                      onTap: showPassword,
                      child: const Padding(
                        padding: EdgeInsets.only(top: 14.0),
                        child: Text(
                          'Show',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Color(0xff5DB075),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  cursorColor: const Color(0xff5DB075),
                  obscureText: isObsecure,
                ),
                const SizedBox(height: 16),
                ReactiveTextField(
                  formControlName: 'PasswordAgain',
                  validationMessages: (controller) {
                    return {
                      'mustMatch':
                          'The password does not match with peviouse password'
                    };
                  },
                  decoration: InputDecoration(
                    hintText: 'Password again',
                    suffixIcon: InkWell(
                      onTap: showPassword,
                      child: const Padding(
                        padding: EdgeInsets.only(top: 14.0),
                        child: Text(
                          'Show',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Color(0xff5DB075),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  cursorColor: const Color(0xff5DB075),
                  obscureText: isObsecure,
                ),
                const SizedBox(height: 16),
                ReactiveTextField(
                  formControlName: 'DateOfBirth',
                  validationMessages: (controller) {
                    return {
                      'required': 'This field is required',
                    };
                  },
                  readOnly: true,
                  onTap: showDatePciker,
                  decoration: const InputDecoration(
                      hintText: 'Date of birth',
                      suffixIcon: Icon(
                        Icons.calendar_today,
                        size: 30,
                        color: Colors.black,
                      )),
                  cursorColor: const Color(0xff5DB075),
                ),
                const SizedBox(height: 16),
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
                            fontWeight: FontWeight.w700,
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
                  child: ReactiveTextField(
                    formControlName: 'Other',
                    validationMessages: (controller) {
                      return {
                        'required': 'This field is required',
                      };
                    },
                    decoration: const InputDecoration(
                      hintText: 'Other',
                    ),
                    cursorColor: const Color(0xff5DB075),
                  ),
                ),
                const SizedBox(height: 38),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Transform.scale(
                      scale: 1.2,
                      child: ReactiveCheckbox(
                        formControlName: 'Agree',
                        activeColor: const Color(0xff5DB075),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
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
                ReactiveFormConsumer(
                  builder: (context, formGroup, child) {
                    return SizedBox(
                      width: double.infinity,
                      child: CupertinoButton(
                        color: const Color(0xff5DB075),
                        borderRadius: BorderRadius.circular(100),
                        padding: const EdgeInsets.all(16),
                        onPressed: formGroup.valid ? _onSubmit : null,
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ),
                    );
                  },
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
      ),
    );
  }
}
