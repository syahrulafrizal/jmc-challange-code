import 'package:flutter/material.dart';
import '../../../config/themes/app_colors.dart';

class BackgroundSafeArea extends StatelessWidget {
  const BackgroundSafeArea({super.key, required this.content});
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        Column(
          children: [
            Expanded(
              child: Container(
                color: AppColors.primary,
              ),
            ),
            Expanded(
              child: Container(
                color: AppColors.neutral_10,
              ),
            )
          ],
        ),
        content,
      ],
    );
  }
}
