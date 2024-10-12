import 'package:flutter/material.dart';

import '../../../config/themes/app_colors.dart';

class ButtonCircle extends StatelessWidget {
  final void Function() onPressed;
  final dynamic text;
  final Color? backgroundColor;
  final Color? borderColor;
  final List<BoxShadow>? shadow;
  final double height;
  final double width;
  final EdgeInsets margin;
  final EdgeInsets padding;

  ///text can provide string for text only, or widget
  const ButtonCircle({
    super.key,
    required this.onPressed,
    required this.text,
    this.backgroundColor,
    this.borderColor,
    this.shadow,
    this.height = 70,
    this.width = 70,
    this.margin = const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
    this.padding = const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        onPressed();
      },
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.white,
          shape: BoxShape.circle,
          border: Border.all(color: borderColor ?? AppColors.neutral_20),
          boxShadow: shadow ??
              [
                BoxShadow(
                  color: Colors.black.withOpacity(0.16),
                  offset: const Offset(0, 1),
                  blurRadius: 1,
                  spreadRadius: 0,
                ),
              ],
        ),
        height: height,
        width: width,
        child: Center(
          child: text is String
              ? Text(
                  text,
                  style: TextStyle(
                    color: AppColors.neutral_80,
                    fontSize: 23,
                    fontWeight: FontWeight.w600,
                  ),
                )
              : text,
        ),
      ),
    );
  }
}
