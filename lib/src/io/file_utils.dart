import 'dart:io';

import 'package:efficient_sdk/src/extension/string_extension.dart';

/// 连接文件夹名和文件名，拼接成完整路径
String joinPath(String dirName, String fileName) {
  if (dirName.endsWith('/')) {
    return '$dirName$fileName';
  } else {
    return '$dirName/$fileName';
  }
}

/// 遍历目录并返回该目录中所有文件的绝对路径
Future<List<String>> dirList(String dirPath) async {
  Stream<FileSystemEntity> fileList = Directory(dirPath).list(recursive: true);

  return fileList
      .where((e) => isFile(e))
      .map((e) => e.path.convertFileSeparator)
      .toList();
}

/// 遍历目录并返回该目录中该层文件的绝对路径
Future<List<String>> dirFirstLayerFileList(String dirPath) async {
  Stream<FileSystemEntity> fileList = Directory(dirPath).list();

  return fileList
      .where((e) => isFile(e))
      .map((e) => e.path.convertFileSeparator)
      .toList();
}

/// 遍历目录并返回该目录中该层文件夹的绝对路径
Future<List<String>> dirFirstLayerDirList(String dirPath) async {
  Stream<FileSystemEntity> fileList = Directory(dirPath).list();

  return fileList
      .where((e) => isDir(e))
      .map((e) => e.path.convertFileSeparator)
      .toList();
}

/// 遍历目录并返回该目录中该层文件的文件名
Future<List<String>> dirFirstLayerFileNameList(String dirPath) async {
  List<String> fileList = await dirFirstLayerFileList(dirPath);
  return fileList.map((e) => getNameFromPath(e)).toList();
}

/// 遍历目录并返回该目录中该层文件夹的文件名
Future<List<String>> dirFirstLayerDirNameList(String dirPath) async {
  List<String> dirList = await dirFirstLayerDirList(dirPath);
  return dirList.map((e) => getNameFromPath(e)).toList();
}

String getNameFromPath(String path) {
  int position = path.convertFileSeparator.lastIndexOf('/') + 1;
  return path.substring(position);
}

/// 判断是否是文件夹
bool isDir(FileSystemEntity entity) {
  FileSystemEntityType type = FileSystemEntity.typeSync(entity.path);
  return type == FileSystemEntityType.directory;
}

/// 判断是否是文件
bool isFile(FileSystemEntity entity) {
  FileSystemEntityType type = FileSystemEntity.typeSync(entity.path);
  return type == FileSystemEntityType.file;
}
