import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jmc_test/app/config/themes/app_colors.dart';

class OptionAction extends StatelessWidget {
  const OptionAction({
    super.key,
    required this.onEdit,
    required this.onDelete,
    this.iconEdit = Icons.edit_outlined,
    this.textEdit = "Edit",
    this.iconCustomAction = Icons.group_outlined,
    this.textCustomAction = "Other",
    this.onCustomAction,
  });
  final Function() onDelete;
  final Function() onEdit;
  final Function()? onCustomAction;
  final IconData iconEdit;
  final String textEdit;
  final IconData iconCustomAction;
  final String textCustomAction;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.only(
          left: 20,
          top: 10,
          bottom: 10,
          right: 10,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(12),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Pilih Aksi",
                      style: TextStyle(
                        fontSize: 13,
                        color: AppColors.neutral_90,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: IconButton(
                      onPressed: () => Get.back(),
                      icon: Icon(
                        Icons.close_rounded,
                        size: 20,
                        color: AppColors.darkRed,
                      ),
                    ),
                  )
                ],
              ),
            ),
            if (onCustomAction != null)
              InkWell(
                onTap: () {
                  onCustomAction!();
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    children: [
                      Icon(
                        iconCustomAction,
                        color: AppColors.darkGreen,
                      ),
                      Text(
                        textCustomAction.trParams({"name": ""}),
                        style: const TextStyle(
                          fontSize: 13,
                        ),
                      ).marginOnly(left: 10),
                    ],
                  ),
                ),
              ),
            InkWell(
              onTap: () {
                onEdit();
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  children: [
                    Icon(
                      iconEdit,
                      color: AppColors.primary,
                    ),
                    Text(
                      textEdit.tr,
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ).marginOnly(left: 10),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                onDelete();
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  children: [
                    Icon(
                      Icons.delete_outline,
                      color: AppColors.darkRed,
                    ),
                    Text(
                      "Hapus",
                      style: const TextStyle(
                        fontSize: 13,
                      ),
                    ).marginOnly(left: 10),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
