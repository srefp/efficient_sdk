/// List扩展类
extension ListExtensions on List {
  void reorder(int oldIndex, int newIndex) {
    // 保留被移动的项
    final tmp = this[oldIndex];
    if (newIndex > oldIndex) {
      // 向后移动，从 oldIndex + 1 到 newIndex ，每个项向前移动一格
      for (int i = oldIndex; i < newIndex - 1; i++) {
        this[i] = this[i + 1];
      }
      this[newIndex - 1] = tmp;
    } else if (newIndex < oldIndex) {
      // 向前移动，从 newIndex 到 oldIndex ，每个项向后移动一格
      for (int i = oldIndex; i > newIndex; i--) {
        this[i] = this[i - 1];
      }
      this[newIndex] = tmp;
    }
  }

  Map<int, int> reorderDb(int oldIndex, int newIndex) {
    // 定义持久化的 id -> orderNum 映射
    Map<int, int> map = {};
    // 保留被移动的项
    final tmp = this[oldIndex];
    if (newIndex > oldIndex) {
      map[this[oldIndex].id] = this[newIndex - 1].orderNum;
      // 向后移动，从 oldIndex + 1 到 newIndex ，每个项向前移动一格
      for (int i = oldIndex; i < newIndex - 1; i++) {
        map[this[i + 1].id] = this[i].orderNum;
        this[i] = this[i + 1];
      }
      this[newIndex - 1] = tmp;

      // 移动内存对象的orderNum
      int tmpOrderNum = this[newIndex - 1].orderNum;
      for (int i = newIndex - 1; i > oldIndex; i--) {
        this[i].orderNum = this[i - 1].orderNum;
      }
      this[oldIndex].orderNum = tmpOrderNum;
    } else if (newIndex < oldIndex) {
      map[this[oldIndex].id] = this[newIndex].orderNum;
      // 向前移动，从 newIndex 到 oldIndex - 1 ，每个项向后移动一格
      for (int i = oldIndex; i > newIndex; i--) {
        map[this[i - 1].id] = this[i].orderNum;
        this[i] = this[i - 1];
      }
      this[newIndex] = tmp;

      // 移动内存对象的orderNum
      int tmpOrderNum = this[newIndex].orderNum;
      for (int i = newIndex; i < oldIndex; i++) {
        this[i].orderNum = this[i + 1].orderNum;
      }
      this[oldIndex].orderNum = tmpOrderNum;
    }
    return map;
  }
}
