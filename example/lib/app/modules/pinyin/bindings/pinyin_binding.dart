import 'package:get/get.dart';

import '../controllers/pinyin_controller.dart';

class PinyinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PinyinController>(
      () => PinyinController(),
    );
  }
}
