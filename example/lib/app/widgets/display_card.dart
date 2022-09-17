import 'package:flutter/material.dart';

class DisplayCard extends StatelessWidget {
  const DisplayCard({
    Key? key,
    required this.textEditingController,
    required this.callback,
    required this.res,
    required this.description,
  }) : super(key: key);

  /// 输入框控制器
  final TextEditingController textEditingController;

  /// 回调函数
  final VoidCallback callback;

  /// 结果
  final String res;

  /// 功能描述
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  decoration: InputDecoration(hintText: '输入'),
                  controller: textEditingController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: TextButton(
                  onPressed: callback,
                  child: Text(description),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text('结果: $res'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
