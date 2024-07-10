import 'package:flutter/material.dart';
import 'package:flutter_application_1/Core/utils/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.borderRadius,
    this.fontSize,
    required this.textcolor,
    required this.backgroundColor,
    required this.text,
  });
  final BorderRadius borderRadius;
  final double? fontSize;
  final Color textcolor;
  final Color backgroundColor;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 45,
        child: TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
              backgroundColor: backgroundColor,
              shape: RoundedRectangleBorder(borderRadius: borderRadius)),
          child: Text(
            text,
            style: Styles.textstyle18.copyWith(
                fontSize: fontSize,
                color: textcolor,
                fontWeight: FontWeight.w900),
          ),
        ),
      ),
    );
  }
}
