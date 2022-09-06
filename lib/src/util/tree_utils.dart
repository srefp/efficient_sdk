extension TreeExtension on List<Map<String, dynamic>> {
  /// 根据id和parentId将列表结构转换成树形结构
  dynamic get tree {
    final config = {
      "id": 'id',
      "parentId": 'parentId',
      "childrenList": 'children',
    };

    // parentId -> d列表，具有共同parentId的json对象
    final childrenListMap = {};
    // id -> d，根据id找到json对象
    final nodeIds = {};
    // 根节点
    final tree = [];

    for (var d in this) {
      final parentId = d[config["parentId"]];
      if (childrenListMap[parentId] == null) {
        childrenListMap[parentId] = [];
      }
      nodeIds[d[config["id"]]] = d;
      childrenListMap[parentId].add(d);
    }

    for (var d in this) {
      final parentId = d[config["parentId"]];
      // parentId为空或者parentId对应的对象为空，则该json对象作为根节点
      if (nodeIds[parentId] == null) {
        tree.add(d);
      }
    }

    for (var t in tree) {
      adaptToChildrenList(t, childrenListMap, config);
    }
    return tree;
  }

  dynamic adaptToChildrenList(o, childrenListMap, config) {
    if (childrenListMap[o[config["id"]]] != null) {
      o[config["childrenList"]] = childrenListMap[o[config["id"]]];
    }
    if (o[config["childrenList"]] != null) {
      for (var c in o[config["childrenList"]]) {
        adaptToChildrenList(c, childrenListMap, config);
      }
    }
  }
}
