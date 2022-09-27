extension TreeExtension on List<dynamic> {
  /// 根据id和parentId将列表结构转换成树形结构
  List<dynamic> get tree {
    final config = {
      "id": 'id',
      "parentId": 'parentId',
      "children": 'children',
    };

    // parentId -> d列表，具有共同parentId的json对象
    final childrenMap = {};
    // id -> d，根据id找到json对象
    final nodeIds = {};
    // 根节点
    final tree = [];

    for (var d in this) {
      final parentId = d[config["parentId"]];
      if (childrenMap[parentId] == null) {
        childrenMap[parentId] = [];
      }
      nodeIds[d[config["id"]]] = d;
      childrenMap[parentId].add(d);
    }

    for (var d in this) {
      final parentId = d[config["parentId"]];
      // parentId为空或者parentId对应的对象为空，则该json对象作为根节点
      if (nodeIds[parentId] == null) {
        tree.add(d);
      }
    }

    for (var t in tree) {
      adaptToChildrenList(t, childrenMap, config);
    }
    return tree;
  }

  dynamic adaptToChildrenList(o, childrenMap, config) {
    if (childrenMap[o[config["id"]]] != null) {
      o[config["children"]] = childrenMap[o[config["id"]]];
    }
    if (o[config["children"]] != null) {
      for (var c in o[config["children"]]) {
        adaptToChildrenList(c, childrenMap, config);
      }
    }
  }
}
