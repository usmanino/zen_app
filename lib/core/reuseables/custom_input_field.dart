import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomInputField extends StatefulWidget {
  final String? hintText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final bool? filled;
  final Color? fillColor;
  final Color? borderColor;
  final Color? enabledBorderColor;
  final Color? focusedBorderColor;
  final bool? isPassword;
  final bool? hasSurfix;
  final dynamic validator;
  final bool? hasPrefix;
  final IconData? prefixIcon;
  final Color? prefixIconColor;
  final bool? readOnly;
  final Function()? onTap;

  const CustomInputField({
    super.key,
    this.hintText,
    this.keyboardType,
    this.controller,
    this.filled = false,
    this.fillColor,
    this.borderColor,
    this.enabledBorderColor,
    this.focusedBorderColor,
    this.isPassword = false,
    this.hasSurfix = false,
    this.validator,
    this.hasPrefix,
    this.prefixIcon,
    this.prefixIconColor,
    this.readOnly,
    this.onTap,
  });

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  late bool _obscureText;

  @override
  void initState() {
    _obscureText = widget.isPassword!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      obscureText: _obscureText,
      style: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      readOnly: widget.readOnly ?? false,
      onTap: widget.onTap,
      validator: widget.validator,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: GoogleFonts.inter(
          color: const Color(0xffA09CAB),
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        filled: widget.filled,
        fillColor: widget.fillColor ?? const Color(0xffEFF1F5),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: widget.borderColor ?? const Color(0xffE8DECF),
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: widget.enabledBorderColor ?? const Color(0xffE8DECF),
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: widget.focusedBorderColor ?? const Color(0xffE8DECF),
            width: 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1,
          ),
        ),
        prefixIcon: widget.hasPrefix == true
            ? Icon(
                widget.prefixIcon,
                color: widget.prefixIconColor!,
              )
            : null,
        suffixIcon: widget.hasSurfix == true
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                child: Icon(
                  _obscureText
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: const Color(0xffA09CAB),
                ),
              )
            : null,
      ),
    );
  }
}
