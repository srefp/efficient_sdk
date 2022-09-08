import 'package:efficient_sdk/efficient_sdk.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PinyinController extends GetxController {

  late TextEditingController getFirstCharacterOfChineseController;

  final res1 = ''.obs;

  @override
  void onInit() {
    getFirstCharacterOfChineseController = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    getFirstCharacterOfChineseController.dispose();
  }

  /// 获取汉字拼音的第一个大写英文字母
  void getFirstCharacterOfChinese() {
    res1.value = getFirstCharacterOfChineseController.text.pinyinFirstLetter;
  }
}
