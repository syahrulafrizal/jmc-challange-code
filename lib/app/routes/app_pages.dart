import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/option_region/bindings/option_region_binding.dart';
import '../modules/option_region/views/option_region_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.OPTION_REGION,
      page: () => const OptionRegionView(),
      binding: OptionRegionBinding(),
    ),
  ];
}
