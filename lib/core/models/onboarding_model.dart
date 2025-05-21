import 'package:flutter/material.dart';

class OnboardingModel {
  IconData? icon;
  String? title;
  String? description;
  String? buttonText;
  Color? buttonColor;
  Color? backgroundColor;
  Color? textColor;

  OnboardingModel({
    this.icon,
    this.title,
    this.description,
    this.buttonText,
    this.buttonColor,
    this.backgroundColor,
    this.textColor,
  });
}
