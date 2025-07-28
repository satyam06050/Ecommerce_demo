import 'package:ecommerce_demo/utils/constants.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
//import '../constant.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double borderRadius;
  final double? width;
  final double verticalPadding;
  final FontWeight fontWeight;
  final bool hasBorder;
  final Color? borderColor;
  final double fontSize;

  const RoundedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.borderRadius = 50,
    this.width,
    this.verticalPadding = 16,
    this.fontWeight = FontWeight.normal,
    this.hasBorder = false,
    this.borderColor,
    this.fontSize = 16,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(borderRadius),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: verticalPadding),
          decoration: BoxDecoration(
            color: backgroundColor ?? kBlackColor,
            borderRadius: BorderRadius.circular(borderRadius),
            border: hasBorder
                ? Border.all(color: borderColor ?? Colors.black)
                : null,
          ),
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              color: textColor ?? Colors.white,
              fontFamily: fontWeight == FontWeight.bold
                  ? 'Inter_bold'
                  : 'Inter_regular',
              fontWeight: fontWeight,
              fontSize: fontSize,
            ),
          ),
        ),
      ),
    );
  }
}

class OutlinedRoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const OutlinedRoundedButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, // full width
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(50),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14),
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(50),
          ),
          alignment: Alignment.center,
          child: const Text(
            'Log in with OTP',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: 'Inter_regular',
            ),
          ),
        ),
      ),
    );
  }
}
