import 'dart:convert';

import 'package:efficient_sdk/efficient_sdk.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  test('测试转换树', () {
    final data = '''
[
  {
    "id": 1,
    "name": "公司领导",
    "children": []
  },
  {
    "id": 2,
    "parentId": 1,
    "name": "刘某某",
    "isOnline": true
  },
  {
    "id": 3,
    "parentId": 1,
    "name": "何某",
    "isOnline": true
  },
  {
    "id": 4,
    "parentId": 0,
    "name": "公司领导",
    "children": []
  },
  {
    "id": 5,
    "parentId": 0,
    "name": "作业部门",
    "children": []
  },
  {
    "id": 6,
    "parentId": 5,
    "name": "刘某某",
    "isOnline": true
  },
  {
    "id": 7,
    "parentId": 5,
    "name": "何某",
    "isOnline": true
  }
] 
''';
    List<dynamic> parsed = json.decode(data);
    final treeData = parsed.tree;
    for (var item in treeData) {
      print(item.runtimeType);
    }
    print(treeData);
  });
}
