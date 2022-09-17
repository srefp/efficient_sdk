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
      body: NavList(
        items: [
          NavItem(
            title: '拼音',
            comment: '拼音相关的功能',
            route: Routes.PINYIN,
          ),
          NavItem(
            title: '日期时间',
            comment: '字符串与日期时间相互转换',
            route: Routes.DATETIME,
          ),
        ],
      ),
    );
  }
}

class NavList extends StatelessWidget {
  const NavList({Key? key, required this.items}) : super(key: key);

  final List<NavItem> items;

  List<Widget> _buildTiles() => items.map((e) => _NavTile(item: e)).toList();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _buildTiles(),
    );
  }
}

class _NavTile extends StatelessWidget {
  const _NavTile({Key? key, required this.item}) : super(key: key);

  final NavItem item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.title),
      subtitle: Text(item.comment),
      trailing: Icon(item.icon),
      onTap: () {
        Get.toNamed(item.route);
      },
    );
  }
}

class NavItem {
  String title;
  String comment;
  String route;
  IconData icon;

  NavItem({
    required this.title,
    required this.comment,
    required this.route,
    this.icon = Icons.arrow_right,
  });
}
