import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../config/themes/app_colors.dart';
import '../buttons/button_fill.dart';
import '../buttons/button_outline.dart';

class DialogConfirmation extends StatelessWidget {
  final dynamic desc, title, onTapOke, onTapCancel, type, isDisplayImage;
  final String? confirmText, cancelText;
  const DialogConfirmation({
    super.key,
    this.title = "Konfirmasi",
    this.type = "other",
    this.isDisplayImage = true,
    required this.desc,
    required this.onTapOke,
    this.confirmText,
    this.cancelText,
    this.onTapCancel,
  });

  @override
  Widget build(BuildContext context) {
    Widget fancyDialog = Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      insetPadding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            'assets/confirmation.svg',
            height: 150,
          ).marginOnly(top: 32),
          Text(
            title.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.neutral_90,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ).marginOnly(top: 20, bottom: 8),
          Text(
            desc,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.grey,
              fontSize: 12,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: ButtonOutline(
                  onPressed: () {
                    Get.back();
                    if (onTapCancel != null) {
                      onTapCancel();
                    }
                  },
                  height: 40,
                  text: Text(
                    cancelText == null ? "Batal" : cancelText ?? "",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: ButtonFill(
                  onPressed: () {
                    Get.back();
                    onTapOke();
                  },
                  backgroundColor: AppColors.primary,
                  height: 40,
                  text: Text(
                    confirmText == null ? "Konfirmasi" : confirmText ?? "",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ).marginOnly(top: 20, bottom: 32),
        ],
      ).paddingSymmetric(
        horizontal: 20,
      ),
    );

    return PopScope(
      canPop: false,
      child: fancyDialog,
    );
  }
}
