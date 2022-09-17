import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "SDK功能展示",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
