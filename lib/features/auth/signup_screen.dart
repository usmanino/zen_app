import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:zen_app/controllers/auth_contoller.dart';
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
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  bool checkedValue = false;

  bool checkValidateInput() {
    return emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        phoneController.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthController>(builder: (context, authController, child) {
      return Scaffold(
        body: authController.isLoading
            ? const Center(child: CircularProgressIndicator())
            : SafeArea(
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
                              CustomInputField(
                                hintText: "Enter your email",
                                controller: emailController,
                                borderColor: const Color(0xffA1824A),
                                focusedBorderColor: const Color(0xffA1824A),
                                enabledBorderColor: const Color(0xffA1824A),
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your email';
                                  } else if (!RegExp(
                                          r'^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'
                                          r'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$')
                                      .hasMatch(value)) {
                                    return 'Please enter a valid email';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              CustomInputField(
                                hintText: "Enter  phone number",
                                controller: phoneController,
                                borderColor: const Color(0xffA1824A),
                                focusedBorderColor: const Color(0xffA1824A),
                                enabledBorderColor: const Color(0xffA1824A),
                                keyboardType: TextInputType.phone,
                                filled: false,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your phone number';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              CustomInputField(
                                hintText: "Enter  your password",
                                controller: passwordController,
                                borderColor: const Color(0xffA1824A),
                                focusedBorderColor: const Color(0xffA1824A),
                                enabledBorderColor: const Color(0xffA1824A),
                                keyboardType: TextInputType.visiblePassword,
                                filled: false,
                                isPassword: true,
                                hasSurfix: true,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your password';
                                  } else if (value!.length < 6) {
                                    return 'Password must be at least 6 characters';
                                  }
                                  return null;
                                },
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
                              CustomButton(
                                text: "Create Account",
                                enable: checkedValue && checkValidateInput(),
                                onPress: () {
                                  if (signupKey.currentState!.validate()) {
                                    Provider.of<AuthController>(context,
                                            listen: false)
                                        .signupWithEmailAndPassword(
                                      emailController.text,
                                      passwordController.text,
                                      phoneController.text,
                                    );

                                    // AuthController().signupWithEmailAndPassword(
                                    //     emailController.text,
                                    //     passwordController.text,
                                    //     phoneController.text);
                                  }
                                },
                              ),
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
                              textStyle:
                                  const TextStyle(color: Color(0xffA1824A))),
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
                                fixedSize:
                                    const Size.fromWidth(double.infinity)),
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
                                textStyle:
                                    const TextStyle(color: Color(0xffA1824A))),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      );
    });
  }
}
