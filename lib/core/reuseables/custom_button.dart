import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zen_app/core/style/colors.dart';
import 'package:zen_app/features/test/onboarding_screen.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final IconData? icon;
  final bool hasIcon;
  final Color? bgColor;
  final Color? textColor;
  final double? fontSize;
  // final VoidCallback onTap;
  final Function() onPress;
  final bool isRounded;
  const CustomButton(
      {super.key,
      required this.text,
      this.icon,
      required this.onPress,
      this.hasIcon = false,
      this.bgColor,
      this.textColor,
      this.fontSize = 20,
      this.isRounded = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 55,
        width: double.infinity,
        decoration: BoxDecoration(
          color: bgColor ?? AppColor().black,
          borderRadius: isRounded
              ? BorderRadius.circular(100)
              : BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: GoogleFonts.inter(
                color: textColor ?? Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: fontSize,
              ),
            ),
            if (hasIcon) ...[
              const SizedBox(width: 10),
              Icon(
                icon,
                color: Colors.white,
              )
            ]
          ],
        ),
      ),
    );
  }
}
