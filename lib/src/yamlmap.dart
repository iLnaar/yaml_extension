import 'package:yaml/yaml.dart';

/// Extension providing utility methods for [YamlMap] conversion.
extension YamlExtension on YamlMap {

  /// Converts this [YamlMap] into a standard [Map<String, dynamic>].
  ///
  /// Nested [YamlMap] values are recursively converted to maps,
  /// and [YamlList] values are recursively converted to lists.
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    nodes.forEach((key, node) {
      map[(key as YamlScalar).value.toString()] = _convertNode(node.value);
    });
    return map;
  }

  /// Recursively converts a [YamlNode] value into a plain Dart object.
  ///
  /// Returns:
  /// * A [Map] if the node is a [YamlMap].
  /// * A [List] if the node is a [YamlList].
  /// * The original value otherwise.
  dynamic _convertNode(dynamic node) {
    if (node is YamlMap) {
      return node.toMap();
    } else if (node is YamlList) {
      final list = <dynamic>[];
      for (var item in node) {
        list.add(_convertNode(item));
      }
      return list;
    }
    return node;
  }
}
