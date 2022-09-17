import 'package:get/get.dart';

import '../controllers/datetime_controller.dart';

class DatetimeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DatetimeController>(
      () => DatetimeController(),
    );
  }
}
