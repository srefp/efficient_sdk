import 'package:efficient_sdk_example/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('主页'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('拼音'),
            subtitle: Text('拼音相关的功能'),
            trailing: Icon(Icons.arrow_right),
            onTap: () {
              Get.toNamed(Routes.PINYIN);
            },
          )
        ],
      ),
    );
  }
}
