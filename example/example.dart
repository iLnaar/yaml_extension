import 'dart:convert';
import 'dart:io';
import 'package:object_extension/object_extension.dart';
import 'package:yaml/yaml.dart';
import 'package:yaml_extension/yaml_extension.dart';

String toMap() {
  /// Load 'pubspec.yaml' file of this package as example
  final file = File('pubspec.yaml');
  final reader = file.openSync(mode: FileMode.read);
  final bytes = reader.readSync(file.lengthSync());
  reader.closeSync();

  /// YamlMap creation
  YamlMap yamlSets = loadYaml(utf8.decode(bytes));

  /// Convert YamlMap to Map
  final map = yamlSets.toMap();

  /// Transformation of Map into a human-readable form
  /// This feature is implemented in the 'object_extension' package
  final structuredString = map.toStructuredString();

  return structuredString;
}

void main() {
  print(toMap());
}