import 'package:efficient_sdk_example/app/widgets/display_card.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/datetime_controller.dart';

class DatetimeView extends GetView<DatetimeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('日期时间'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Obx(() {
            return DisplayCard(
              textEditingController: controller.inputController,
              callback: controller.convertStringToDate,
              res: controller.res1.value,
              description: '字符串转日期',
            );
          }),
          Obx(() {
            return DisplayCard(
              textEditingController: controller.secondsInputController,
              callback: controller.convertIntToTime,
              res: controller.res2.value,
              description: '整数转时间',
            );
          })
        ],
      ),
    );
  }
}
