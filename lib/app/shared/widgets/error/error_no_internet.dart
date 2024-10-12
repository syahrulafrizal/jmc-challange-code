import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_utils/get_utils.dart';

class ErrorNoInternet extends StatelessWidget {
  final Function onReload;
  const ErrorNoInternet({super.key, required this.onReload});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Tidak Ada koneksi Internet',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          SvgPicture.asset(
            'assets/error_no_internet.svg',
            width: 100,
            height: 100,
          ).marginSymmetric(vertical: 6),
          const Text(
            'Pastikan perangkat Anda sudah terhubung dengan jarigan internet',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12),
          ),
          GestureDetector(
            onTap: () => onReload(),
            child: const Text(
              'button_try_again',
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
