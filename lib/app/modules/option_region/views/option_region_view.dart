import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jmc_test/app/config/themes/app_colors.dart';
import 'package:jmc_test/app/data/response/regions/response_regions.dart';
import 'package:jmc_test/app/shared/widgets/builder/loading_widget.dart';
import 'package:jmc_test/app/shared/widgets/error/error_empty_data.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../controllers/option_region_controller.dart';

class OptionRegionView extends GetView<OptionRegionController> {
  const OptionRegionView({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            controller.arguments['code'] == null
                ? "Daftar Provinsi"
                : "Daftar Kota/Kabupaten ${(controller.arguments['name'] ?? '-').toString().capitalize}",
            overflow: TextOverflow.ellipsis,
          ),
          centerTitle: true,
        ),
        body: Obx(
          () => LoadingWidget(
            isLoading: controller.isLoading.value,
            data: controller.data,
            errorChild: ErrorEmptyData(onReload: () => controller.onRefresh()),
            emptyChild: ErrorEmptyData(onReload: () => controller.onRefresh()),
            child: SmartRefresher(
              controller: controller.refreshCt,
              onRefresh: controller.onRefresh,
              enablePullDown: !controller.isLoading.value,
              enablePullUp: controller.hasNextPage.value,
              onLoading: () {
                controller.onLoadingMore();
              },
              header: WaterDropMaterialHeader(
                backgroundColor: AppColors.primary,
              ),
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: 10),
                itemCount: controller.data.length,
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemBuilder: (context, index) {
                  Region item = controller.data[index];
                  return InkWell(
                    onTap: () {
                      Get.back(result: item);
                    },
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      minTileHeight: 24,
                      minLeadingWidth: 12,
                      leading: const Icon(Icons.location_city),
                      title: Text(item.nama ?? ""),
                    ),
                  ).paddingSymmetric(horizontal: 15);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
