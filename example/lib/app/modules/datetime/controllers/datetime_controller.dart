import 'package:efficient_sdk/efficient_sdk.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DatetimeController extends GetxController {
  late final TextEditingController inputController;
  late final TextEditingController secondsInputController;

  final res1 = ''.obs;
  final res2 = ''.obs;

  @override
  void onInit() {
    inputController = TextEditingController();
    secondsInputController = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    inputController.dispose();
    secondsInputController.dispose();
  }

  void convertStringToDate() {
    res1.value = inputController.text;
  }

  void convertIntToTime() {
    res2.value = int.parse(secondsInputController.text).getTime();
  }
}
