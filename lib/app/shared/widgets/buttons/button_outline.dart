import 'package:flutter/material.dart';

class ButtonOutline extends StatelessWidget {
  final void Function()? onPressed;
  final dynamic text;
  final Color? backgroundColor;
  final Color? bgColor;
  final double height;
  final double width;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final double radius;
  final double borderWidth;

  ///text can provide string for text only, or widget
  const ButtonOutline({
    super.key,
    required this.onPressed,
    required this.text,
    this.backgroundColor,
    this.height = 40,
    this.width = double.infinity,
    this.margin = const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
    this.padding = const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
    this.radius = 10,
    this.borderWidth = 1.5,
    this.bgColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      constraints: BoxConstraints(minWidth: width),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        child: InkWell(
          onTap: onPressed != null
              ? () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  onPressed!();
                }
              : null,
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          splashColor: (backgroundColor ?? Theme.of(context).colorScheme.primary).withOpacity(0.2),
          child: Container(
            alignment: Alignment.center,
            margin: margin,
            padding: padding,
            decoration: BoxDecoration(
              border: Border.all(
                width: borderWidth,
                color: onPressed == null
                    ? (backgroundColor ?? Theme.of(context).colorScheme.primary).withOpacity(0.4)
                    : backgroundColor ?? Theme.of(context).colorScheme.primary,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(radius),
              ),
            ),
            child: text is String
                ? Text(
                    text,
                    style: TextStyle(
                      color: backgroundColor ?? Theme.of(context).colorScheme.primary,
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
