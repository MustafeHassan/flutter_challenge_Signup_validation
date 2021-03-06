import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// import '../text_form.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        title: const Text(
          "Log in",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Name',
              ),
              cursorColor: Color(0xff5DB075),
            ),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Password',
              ),
              obscureText: true,
              cursorColor: Color(0xff5DB075),
            ),
            const SizedBox(height: 16),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: CupertinoButton(
                color: const Color(0xff5DB075),
                borderRadius: BorderRadius.circular(100),
                padding: const EdgeInsets.all(16),
                child: const Text(
                  "Log in",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                onPressed: () {},
              ),
            ),
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
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
