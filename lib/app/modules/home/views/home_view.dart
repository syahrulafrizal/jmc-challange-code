import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jmc_test/app/config/themes/app_colors.dart';
import 'package:jmc_test/app/shared/widgets/builder/option_action.dart';
import 'package:jmc_test/app/shared/widgets/buttons/button_fill.dart';
import 'package:jmc_test/app/shared/widgets/buttons/button_outline.dart';
import 'package:jmc_test/app/shared/widgets/dialog/dialog_confirmation.dart';
import 'package:jmc_test/app/shared/widgets/error/error_empty_data.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('HomeView'),
          centerTitle: true,
        ),
        body: Obx(
          () => Column(
            children: [
              InkWell(
                onTap: controller.onSelectProvince,
                child: TextField(
                  controller: controller.inputProvince,
                  cursorColor: AppColors.neutral_90,
                  style: TextStyle(
                    color: AppColors.neutral_90,
                  ),
                  textAlignVertical: TextAlignVertical.center,
                  enabled: false,
                  onChanged: controller.onValidationFormInput,
                  decoration: InputDecoration(
                    hintText: "Pilih Provinsi",
                    labelText: "Provinsi",
                    errorText: !controller.validateProvince.value ? controller.msgProvince.value : null,
                  ),
                ).marginOnly(top: 12),
              ).paddingSymmetric(horizontal: 15),
              InkWell(
                onTap: controller.onSelectCity,
                child: TextField(
                  controller: controller.inputCity,
                  cursorColor: AppColors.neutral_90,
                  style: TextStyle(
                    color: AppColors.neutral_90,
                  ),
                  enabled: false,
                  textAlignVertical: TextAlignVertical.center,
                  onChanged: controller.onValidationFormInput,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: "Pilih Kota/Kabupaten",
                    labelText: "Kota/Kabupaten",
                    errorText: !controller.validateCity.value ? controller.msgCity.value : null,
                  ),
                ).marginOnly(top: 24),
              ).paddingSymmetric(horizontal: 15),
              Row(
                children: [
                  if (controller.idUpdate.value != 0)
                    Expanded(
                      child: ButtonOutline(
                        onPressed: () {
                          controller.cancelDataUpdate();
                        },
                        height: 40,
                        text: Text(
                          "Batal Edit Data",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.primary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ).marginOnly(right: 15),
                    ),
                  Expanded(
                    child: ButtonFill(
                      onPressed: () {
                        Get.dialog(
                          DialogConfirmation(
                            desc: "Apakah Anda yakin ingin menyimpan data?",
                            onTapOke: () {
                              controller.doSaveData();
                            },
                          ),
                        );
                      },
                      height: 40,
                      text: Text(
                        "Simpan Data",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ).marginOnly(top: 32).paddingSymmetric(horizontal: 15),
              Divider(
                color: AppColors.neutral_30,
                thickness: 8,
              ).marginOnly(top: 24),
              Text(
                "Data Terpilih",
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.neutral_90,
                  fontWeight: FontWeight.w600,
                ),
              ).marginOnly(top: 12, left: 15, right: 15),
              if (controller.data.isNotEmpty)
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 15),
                    separatorBuilder: (context, index) {
                      return const Divider();
                    },
                    itemCount: controller.data.length,
                    itemBuilder: (context, index) {
                      var item = controller.data[index];
                      return InkWell(
                        onTap: () {
                          Get.bottomSheet(
                            OptionAction(
                              onEdit: () {
                                Get.back();
                                controller.setDataUpdate(item);
                              },
                              onDelete: () {
                                Get.back();
                                controller.doDeleteData(item['id'] as int? ?? 0);
                              },
                            ),
                          );
                        },
                        child: ListTile(
                          minTileHeight: 24,
                          minLeadingWidth: 12,
                          leading: const Icon(Icons.location_city),
                          trailing: const Icon(Icons.more_vert),
                          title: Text(item["provinceName"] as String? ?? ""),
                          subtitle: Text(item["cityName"] as String? ?? ""),
                        ),
                      );
                    },
                  ),
                )
              else
                ErrorEmptyData().marginOnly(top: 60)
            ],
          ),
        ),
      ),
    );
  }
}
