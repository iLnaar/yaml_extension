
import 'package:yaml/yaml.dart';


///
///
///
dynamic _convertNode(dynamic node) {
  if (node is YamlMap) {
    return _toMap(node);
  } else if (node is YamlList) {
    final list = <dynamic>[];
    for (var item in node) {
      list.add(_convertNode(item));
    }
    return list;
  }
  return node;
}

///
///
///
Map<String, dynamic> _toMap(YamlMap yamlMap) {
  var map = <String, dynamic>{};
  yamlMap.nodes.forEach((key, node) {
    map[(key as YamlScalar).value.toString()] = _convertNode(node.value);
  });
  return map;
}

///
///
///
Map<String, dynamic> yamlToMap(String yaml) => _toMap(loadYaml(yaml));
