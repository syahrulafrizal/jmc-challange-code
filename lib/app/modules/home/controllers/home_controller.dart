import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jmc_test/app/config/constants/app_constant.dart';
import 'package:jmc_test/app/data/response/regions/response_regions.dart';
import 'package:jmc_test/app/routes/app_pages.dart';
import 'package:jmc_test/app/shared/utils/common_function.dart';
import 'package:jmc_test/app/shared/utils/sql_helper.dart';

class HomeController extends GetxController {
  RxBool isValidateFirst = false.obs;

  TextEditingController inputProvince = TextEditingController();
  RxBool validateProvince = true.obs;
  RxString provinceCode = "".obs;
  RxString msgProvince = "".obs;

  TextEditingController inputCity = TextEditingController();
  RxBool validateCity = true.obs;
  RxString cityCode = "".obs;
  RxString msgCity = "".obs;

  RxList<Map<String, Object?>> data = <Map<String, Object?>>[].obs;

  RxInt idUpdate = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    SqlHelper.getData(AppConstant.LOCAL_DB_TABLE).then((value) {
      data.assignAll(value);
    });
  }

  @override
  void onClose() {
    super.onClose();
  }

  onValidationFormInput(String? val) {
    if (isValidateFirst.value) {
      String valueProvince = inputProvince.text.trim();
      String valueCity = inputCity.text.trim();

      if (valueProvince.isEmpty) {
        validateProvince.value = false;
        msgProvince.value = "Provinsi tidak boleh kosong";
      } else {
        validateProvince.value = true;
        msgProvince.value = "";
      }

      if (valueCity.isEmpty) {
        validateCity.value = false;
        msgCity.value = "Kota/Kabupaten tidak boleh kosong";
      } else {
        validateCity.value = true;
        msgCity.value = "";
      }
    }

    return validateProvince.value && validateCity.value;
  }

  onSelectProvince() async {
    var result = await Get.toNamed(
      Routes.OPTION_REGION,
      arguments: {},
    );

    if (result != null) {
      Region reg = result;
      provinceCode.value = reg.kode ?? "";
      inputProvince.text = reg.nama ?? "";

      cityCode.value = "";
      inputCity.clear();
    }
  }

  onSelectCity() async {
    var result = await Get.toNamed(
      Routes.OPTION_REGION,
      arguments: {
        "code": "${provinceCode.value}.__",
        "name": inputProvince.text,
      },
    );

    if (result != null) {
      Region reg = result;
      cityCode.value = reg.kode ?? "";
      inputCity.text = reg.nama ?? "";
    }
  }

  doSaveData() {
    isValidateFirst.value = true;
    if (onValidationFormInput(null)) {
      if (idUpdate.value > 0) {
        doUpdateData(idUpdate.value);
      } else {
        doCreateData();
      }
    }
  }

  setDataUpdate(item) {
    inputCity.text = item["cityName"];
    cityCode.value = item["cityCode"];
    inputProvince.text = item["provinceName"];
    provinceCode.value = item["provinceCode"];
    idUpdate.value = item["id"];
  }

  cancelDataUpdate() {
    inputCity.clear();
    cityCode.value = "";
    inputProvince.clear();
    provinceCode.value = "";
    idUpdate.value = 0;
  }

  doCreateData() {
    SqlHelper.insert(AppConstant.LOCAL_DB_TABLE, {
      "provinceCode": provinceCode.value,
      "provinceName": inputProvince.text,
      "cityCode": cityCode.value,
      "cityName": inputCity.text,
    }).then((value) {
      if (value > 0) {
        inputCity.clear();
        cityCode.value = "";
        inputProvince.clear();
        provinceCode.value = "";

        SqlHelper.getData(AppConstant.LOCAL_DB_TABLE).then((value) {
          data.assignAll(value);
        });

        CommonFunction.snackbarHelper(
          message: "Data berhasil disimpan",
          isSuccess: true,
        );
      } else {
        CommonFunction.snackbarHelper(
          message: "Gagal menyimpan data",
          isSuccess: false,
        );
      }
    });
  }

  doDeleteData(int id) {
    SqlHelper.delete(AppConstant.LOCAL_DB_TABLE, id).then((value) {
      if (value > 0) {
        SqlHelper.getData(AppConstant.LOCAL_DB_TABLE).then((value) {
          data.assignAll(value);
        });

        CommonFunction.snackbarHelper(
          message: "Data berhasil dihapus",
          isSuccess: true,
        );
      } else {
        CommonFunction.snackbarHelper(
          message: "Gagal menghapus data",
          isSuccess: false,
        );
      }
    });
  }

  doUpdateData(int id) {
    SqlHelper.update(AppConstant.LOCAL_DB_TABLE, id, {
      "provinceCode": provinceCode.value,
      "provinceName": inputProvince.text,
      "cityCode": cityCode.value,
      "cityName": inputCity.text,
    }).then((value) {
      if (value > 0) {
        inputCity.clear();
        cityCode.value = "";
        inputProvince.clear();
        provinceCode.value = "";

        idUpdate.value = 0;

        SqlHelper.getData(AppConstant.LOCAL_DB_TABLE).then((value) {
          data.assignAll(value);
        });

        CommonFunction.snackbarHelper(
          message: "Data berhasil diupdate",
          isSuccess: true,
        );
      } else {
        CommonFunction.snackbarHelper(
          message: "Gagal mengupdate data",
          isSuccess: false,
        );
      }
    });
  }
}
