import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_utils/get_utils.dart';

class ErrorData extends StatelessWidget {
  final Function()? onReload;
  const ErrorData({super.key, this.onReload});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "${'Maaf ada sedikit masalah'}!",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          SvgPicture.asset(
            'assets/error_data.svg',
            width: 100,
            height: 100,
          ).marginSymmetric(vertical: 6),
          const Text(
            '${"Jangan Khawatir, mungkin hanya gangguan jaringan."}\n${"Coba untuk melakukan reload aplikasi"}!',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12),
          ),
          if (onReload != null)
            GestureDetector(
              onTap: () => onReload!(),
              child: const Text(
                "button_try_again",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ).marginOnly(top: 10),
            ),
        ],
      ).paddingSymmetric(horizontal: 20),
    );
  }
}
