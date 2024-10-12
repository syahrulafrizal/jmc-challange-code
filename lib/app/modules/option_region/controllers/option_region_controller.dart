import 'package:get/get.dart';
import 'package:jmc_test/app/config/networking/service/regions.dart' as service;
import 'package:jmc_test/app/data/response/regions/response_regions.dart';
import 'package:jmc_test/app/shared/utils/common_function.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class OptionRegionController extends GetxController {
  RxList<Region> data = <Region>[].obs;
  RxBool isLoading = true.obs;
  var refreshCt = RefreshController();
  RxInt page = 1.obs;
  RxBool hasNextPage = false.obs;

  var arguments = Get.arguments;

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  onRefresh() async {
    isLoading.value = true;
    page.value = 1;
    data.clear();
    refreshCt.refreshCompleted();
    getData();
  }

  onLoadingMore() async {
    page.value++;
    getData();
  }

  getData() async {
    service.Regions.list(
      page: page.value,
      code: arguments['code'] ?? "__",
    ).then(
      (value) async {
        isLoading.value = false;
        refreshCt.loadComplete();
        if (value is ResponseRegions) {
          if (page.value == 1) {
            data.assignAll(value.data ?? []);
          } else {
            data.addAll(value.data ?? []);
          }
          hasNextPage.value = (value.page ?? 1) < (value.totalPage ?? 1);
        } else {
          CommonFunction.snackbarHelper(
            message: "Failed to get data",
            isSuccess: false,
          );
        }
      },
      onError: (e) {
        printInfo(info: e.toString());
        isLoading.value = false;
        refreshCt.loadComplete();
        CommonFunction.snackbarHelper(
          message: e.toString(),
          isSuccess: false,
        );
      },
    );
  }
}
