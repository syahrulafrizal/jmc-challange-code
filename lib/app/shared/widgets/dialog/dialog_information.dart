import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../config/themes/app_colors.dart';
import '../buttons/button_fill.dart';

class DialogInformation extends StatelessWidget {
  final dynamic desc, title, onTapOke, logoAssets, illustrationAssets, buttonLabel, canPop;
  const DialogInformation({
    super.key,
    this.title = "Informasi",
    required this.desc,
    required this.onTapOke,
    this.logoAssets,
    this.illustrationAssets,
    this.canPop = false,
    this.buttonLabel = "Tutup",
  });

  @override
  Widget build(BuildContext context) {
    Dialog fancyDialog = Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      insetPadding: const EdgeInsets.all(20),
      child: SizedBox(
        width: Get.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SvgPicture.asset(
              'assets/information.svg',
              height: 44,
            ).marginOnly(top: 32),
            Text(
              "$title",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.neutral_90,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ).marginOnly(top: 20, bottom: 8),
            (desc is String)
                ? Text(
                    "$desc",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.grey,
                      fontSize: 12,
                    ),
                  )
                : desc,
            Row(
              children: [
                Expanded(
                  child: ButtonFill(
                    onPressed: () {
                      Get.back();
                      onTapOke();
                    },
                    backgroundColor: AppColors.primary,
                    height: 40,
                    text: Text(
                      buttonLabel.toString(),
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
        ).paddingSymmetric(horizontal: 20),
      ),
    );

    return PopScope(
      canPop: canPop,
      child: fancyDialog,
    );
  }
}
