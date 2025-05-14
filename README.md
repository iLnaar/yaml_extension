The package extends the functionality of the [`yaml`](https://pub.dev/documentation/yaml/latest/yaml/yaml-library.html) library

## Method list

| Method | Used for |
|--------|----------|
| [`toMap()`](https://pub.dev/documentation/yaml_extension/latest/yaml_extension/YamlExtension/toMap.html) | Allows you to convert text data in yaml format to Map&lt;String, dynamic&gt; |

## Getting started

To use any functions of the package,
just [install and import it](https://pub.dev/packages/yaml_extension/install).

## Usage

Below are example of transformations of
[pubspec.yaml](https://github.com/iLnaar/yaml_extension/blob/master/pubspec.yaml) file of this package

Load 'pubspec.yaml' file of this package as example:

```dart
final file = File('pubspec.yaml');
final reader = file.openSync(mode: FileMode.read);
final bytes = reader.readSync(file.lengthSync());
reader.closeSync();
```

YamlMap creation:

```dart
YamlMap yamlSets = loadYaml(utf8.decode(bytes));
```

Convert YamlMap to Map:

```dart
final map = yamlSets.toMap();
```

Transformation of Map into a human-readable form.
This feature is implemented in [`toStructuredString()`](https://pub.dev/documentation/object_extension/latest/object_extension/ObjectExtension/toStructuredString.html)
method of 'object_extension' package:

```dart
final structuredString = map.toStructuredString();
```

Print result:

```dart
print('\n$structuredString');
```

Output:

```
{
  name: 'yaml_extension',
  description: 'The package provides functions to simplify the work with yaml files.',
  version: '1.0.1',
  repository: 'https://github.com/iLnaar/yaml_extension',
  environment: {
    sdk: '>=2.14.4 <3.0.0'
  },
  dev_dependencies: {
    lints: '^1.0.0',
    test: '^1.16.0'
  },
  dependencies: {
    object_extension: '^1.0.2',
    yaml: '^3.1.0'
  }
}
```
