import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:zen_app/controllers/auth_contoller.dart';
import 'package:zen_app/core/reuseables/custom_button.dart';
import 'package:zen_app/core/reuseables/custom_input_field.dart';
import 'package:zen_app/core/style/colors.dart';
import 'package:zen_app/features/auth/signup_screen.dart';
import 'package:zen_app/features/dashboard/dashboard.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthController>(builder: (context, authController, child) {
      return Scaffold(
        body: authController.isLoading
            ? const Center(child: CircularProgressIndicator())
            : SafeArea(
                child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome Back!',
                      style: GoogleFonts.inter(
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          CustomInputField(
                            hintText: 'Enter your email',
                            controller: emailController,
                            filled: true,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your email';
                              } else if (!RegExp(r'^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'
                                      r'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$')
                                  .hasMatch(value)) {
                                return 'Please enter a valid email';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.emailAddress,
                            borderColor: Colors.transparent,
                            enabledBorderColor: Colors.transparent,
                            focusedBorderColor: Colors.transparent,
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          CustomInputField(
                            hintText: 'Enter password',
                            controller: passwordController,
                            filled: true,
                            isPassword: true,
                            hasSurfix: true,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.visiblePassword,
                            borderColor: Colors.transparent,
                            enabledBorderColor: Colors.transparent,
                            focusedBorderColor: Colors.transparent,
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          CustomButton(
                            text: 'Log In',
                            onPress: () {
                              if (formKey.currentState!.validate()) {
                                Provider.of<AuthController>(context,
                                        listen: false)
                                    .loginWithEmailAndPassword(
                                  emailController.text,
                                  passwordController.text,
                                  context,
                                );
                              }
                            },
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          const Divider(
                            thickness: 2,
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Don't have an account? Sign Up",
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff1C1B1F),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          CustomButton(
                            text: 'Sign Up',
                            bgColor: const Color(0xffEFF1F5),
                            textColor: AppColor().black,
                            onPress: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                          const SignupScreen()));
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
      );
    });
  }
}
