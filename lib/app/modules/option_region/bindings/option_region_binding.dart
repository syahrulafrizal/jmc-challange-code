import 'package:get/get.dart';

import '../controllers/option_region_controller.dart';

class OptionRegionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OptionRegionController>(
      () => OptionRegionController(),
    );
  }
}
