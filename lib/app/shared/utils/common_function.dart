import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CommonFunction {
  static loadingShow({String message = "Loading..."}) {
    return Get.dialog(
      barrierDismissible: false,
      barrierColor: const Color(0xFF333333).withOpacity(0.8),
      PopScope(
        canPop: false,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(
                color: Colors.white,
              ),
              DefaultTextStyle(
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                ),
                child: Text(
                  message,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  ),
                ).marginOnly(top: 15.5),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static loadingHide() {
    if (Get.isDialogOpen ?? false) Navigator.of(Get.overlayContext!).pop();
  }

  static snackbarHelper({
    dynamic message,
    bool isSuccess = true,
    void Function()? mainButtonOnPressed,
    Widget? mainButton,
    Duration duration = const Duration(seconds: 3),
  }) {
    return Get.rawSnackbar(
      messageText: Text(
        message.toString().length < 100 ? message.toString() : '${message.toString().substring(0, 100)}...',
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w400,
          fontSize: 12,
        ),
      ),
      backgroundColor: isSuccess ? const Color(0xFF29823B) : const Color(0xFFDC2020),
      duration: duration,
      barBlur: 8.0,
      borderRadius: 10,
      padding: const EdgeInsets.only(top: 20, bottom: 20, right: 16),
      mainButton: mainButtonOnPressed == null
          ? null
          : TextButton(
              onPressed: mainButtonOnPressed,
              child: mainButton ??
                  const Text(
                    'Lihat',
                    style: TextStyle(color: Colors.white),
                  ),
            ),
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0, bottom: 30),
      icon: Icon(
        isSuccess ? Icons.check_circle_rounded : Icons.warning_rounded,
        color: Colors.white,
        size: 24,
      ),
      boxShadows: [
        BoxShadow(
          color: Colors.black.withOpacity(0.25),
          offset: const Offset(0, 10),
          blurRadius: 20,
          spreadRadius: 0,
        ),
      ],
    );
  }

  static convertFormatNumber(num value) {
    final formatCurrency = NumberFormat("#,###.#", "ID");
    if (value == 0) {
      return "0";
    }
    return formatCurrency.format(value).toString();
  }
}
