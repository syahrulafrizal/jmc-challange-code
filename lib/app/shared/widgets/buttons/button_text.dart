import 'package:flutter/material.dart';

class ButtonText extends StatelessWidget {
  final void Function()? onPressed;
  final dynamic text;
  final TextStyle? textStyle;

  ///text can provide string for text only, or widget
  const ButtonText({
    super.key,
    required this.onPressed,
    required this.text,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed != null
          ? () {
              FocusScope.of(context).requestFocus(FocusNode());
              onPressed!();
            }
          : null,
      child: text is Widget
          ? text
          : Text(
              text,
              style: textStyle ??
                  TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
            ),
    );
  }
}
