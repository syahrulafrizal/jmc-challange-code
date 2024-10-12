import 'package:flutter/material.dart';

import '../../../config/themes/app_colors.dart';

class ButtonFill extends StatelessWidget {
  final void Function()? onPressed;
  final dynamic text;
  final Color? backgroundColor;
  final double height;
  final double width;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final double radius;

  ///text can provide string for text only, or widget
  const ButtonFill({
    super.key,
    required this.onPressed,
    required this.text,
    this.backgroundColor,
    this.height = 40,
    this.width = double.infinity,
    this.margin = const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
    this.padding = const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
    this.radius = 10,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: margin,
      height: height,
      width: width,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        child: MaterialButton(
          padding: padding,
          color: backgroundColor ?? Theme.of(context).colorScheme.primary,
          disabledColor: AppColors.neutral_40.withOpacity(0.5),
          onPressed: onPressed != null
              ? () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  onPressed!();
                }
              : null,
          disabledTextColor: Colors.white,
          child: Center(
            child: text is String
                ? Text(
                    text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                : text,
          ),
        ),
      ),
    );
  }
}
