import 'package:efficient_sdk/efficient_sdk.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DatetimeController extends GetxController {
  late final TextEditingController inputController;

  final res1 = ''.obs;

  @override
  void onInit() {
    inputController = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    inputController.dispose();
  }

  void convertStringToDate() {
    res1.value = inputController.text;
  }
}
