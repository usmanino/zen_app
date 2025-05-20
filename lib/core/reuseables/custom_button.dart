import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zen_app/features/onboarding/onboarding_screen.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final IconData? icon;
  final bool hasIcon;
  final Color? bgColor;
  final Color? textColor;
  final double? fontSize;
  // final VoidCallback onTap;
  final Function() onPress;
  const CustomButton({
    super.key,
    required this.text,
    this.icon,
    required this.onPress,
    this.hasIcon = false,
    this.bgColor = const Color.fromARGB(255, 18, 80, 20),
    this.textColor,
    this.fontSize = 20,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 55,
        width: double.infinity,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: GoogleFonts.poppins(
                color: textColor ?? Colors.white,
                fontWeight: FontWeight.w700,
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
