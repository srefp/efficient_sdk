import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../widgets/display_card.dart';
import '../controllers/pinyin_controller.dart';

class PinyinView extends GetView<PinyinController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('拼音'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Obx(() {
            return DisplayCard(
              textEditingController:
                  controller.getFirstCharacterOfChineseController,
              callback: controller.getFirstCharacterOfChinese,
              res: controller.res1.value,
            );
          }),
        ],
      ),
    );
  }
}
