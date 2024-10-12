import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_utils/get_utils.dart';

class ErrorEmptyData extends StatelessWidget {
  final Function()? onReload;
  final String desc;
  const ErrorEmptyData({
    super.key,
    this.onReload,
    this.desc = 'Tidak ada data yang ditampilkan',
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/error_empty_data.svg',
            width: 100,
            height: 100,
          ).marginSymmetric(vertical: 6),
          Text(
            desc,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12),
          ),
          if (onReload != null)
            GestureDetector(
              onTap: () => onReload!(),
              child: const Text(
                'Coba Lagi',
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
