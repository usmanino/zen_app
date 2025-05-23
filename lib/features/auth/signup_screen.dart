import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:zen_app/core/reuseables/custom_button.dart';
import 'package:zen_app/core/reuseables/custom_input_field.dart';
import 'package:zen_app/features/auth/login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final signupKey = GlobalKey<FormState>();
  bool checkedValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Create Account",
                  style: GoogleFonts.plusJakartaSans(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 32),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  "Log in or create a new account",
                  style: GoogleFonts.plusJakartaSans(
                      fontSize: 14, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Form(
                  key: signupKey,
                  child: Column(
                    children: [
                      const CustomInputField(
                        hintText: "Enter your email",
                        borderColor: Color(0xffA1824A),
                        focusedBorderColor: Color(0xffA1824A),
                        enabledBorderColor: Color(0xffA1824A),
                        keyboardType: TextInputType.emailAddress,
                        filled: false,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      const CustomInputField(
                        hintText: "Enter  phone number",
                        borderColor: Color(0xffA1824A),
                        focusedBorderColor: Color(0xffA1824A),
                        enabledBorderColor: Color(0xffA1824A),
                        keyboardType: TextInputType.phone,
                        filled: false,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      const CustomInputField(
                        hintText: "Enter  your password",
                        borderColor: Color(0xffA1824A),
                        focusedBorderColor: Color(0xffA1824A),
                        enabledBorderColor: Color(0xffA1824A),
                        keyboardType: TextInputType.visiblePassword,
                        filled: false,
                        isPassword: true,
                        hasSurfix: true,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            checkedValue = !checkedValue;
                          });
                          print("toggled state: $checkedValue");
                        },
                        child: Row(
                          children: [
                            CupertinoCheckbox(
                              value: checkedValue,
                              activeColor: const Color(0xffA1824A),
                              onChanged: (bool? newValue) {
                                setState(() {
                                  checkedValue = newValue!;
                                });
                                print("toggled state: $checkedValue");
                              },
                            ),
                            Text(
                              "I agree with Terms & Conditions",
                              style: GoogleFonts.plusJakartaSans(
                                  color: const Color(0xff1C170D),
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      CustomButton(text: "Create Account", onPress: () {}),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  "Or",
                  style: GoogleFonts.plusJakartaSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      textStyle: const TextStyle(color: Color(0xffA1824A))),
                ),
                SizedBox(
                  height: 2.h,
                ),
                CustomButton(
                    text: "Continue with Apple",
                    isRounded: true,
                    bgColor: const Color(0xffF5F0E5),
                    textColor: Colors.black,
                    onPress: () {
                      print("login with Apple");
                    }),
                SizedBox(
                  height: 2.h,
                ),
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffF5F0E5),
                        foregroundColor: Colors.white,
                        fixedSize: const Size.fromWidth(double.infinity)),
                    child: const Text(
                      "Login with Google",
                      style: TextStyle(color: Colors.black),
                    )),
                SizedBox(
                  height: 4.h,
                ),
                Text(
                  "Already registered?",
                  style: GoogleFonts.plusJakartaSans(
                      fontSize: 14, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 2.h,
                ),
                GestureDetector(
                  onTap: () {
                    print("right here");
                    Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              const LoginScreen(),
                        ));
                  },
                  child: Text(
                    "Login",
                    style: GoogleFonts.plusJakartaSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        textStyle: const TextStyle(color: Color(0xffA1824A))),
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

