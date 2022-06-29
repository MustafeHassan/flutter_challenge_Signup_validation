import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextForm extends StatelessWidget {
  const TextForm(
      {Key? key,
      required this.hintText,
      this.isPasswordField = false,
      this.showPassord,
      this.isDateOfBirthField = false,
      this.isObsecureText = true,
      this.controller,
      this.getDate})
      : super(key: key);
  final String hintText;
  final bool isPasswordField;
  final bool isDateOfBirthField;
  final VoidCallback? getDate;
  final VoidCallback? showPassord;
  final TextEditingController? controller;
  final bool? isObsecureText;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: CupertinoTextField(
        padding: const EdgeInsets.all(16.0),
        placeholder: hintText,
        placeholderStyle: const TextStyle(
          fontSize: 16.0,
          color: Color(0xffBDBDBD),
        ),
        readOnly: isDateOfBirthField,
        obscureText: isObsecureText!,
        controller: controller,
        suffix: isPasswordField
            ? CupertinoButton(
                onPressed: showPassord,
                child: const Text(
                  'Show',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Color(0xff5DB075),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            : isDateOfBirthField
                ? Padding(
                    padding: const EdgeInsets.only(right: 9.31, bottom: 9.31),
                    child: IconButton(
                      onPressed: getDate,
                      icon: const Icon(Icons.calendar_today, size: 45),
                    ),
                  )
                : const SizedBox(),
        decoration: BoxDecoration(
          border: Border.all(width: 1.0, color: const Color(0xffE8E8E8)),
          borderRadius: BorderRadius.circular(8.0),
          color: const Color(0xffF6F6F6),
        ),
      ),
    );
  }
}
