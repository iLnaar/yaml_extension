# yaml_extension

The package extends the functionality of the [`yaml`](https://pub.dev/packages/yaml) library.

## Features

| Method | Used for |
|--------|----------|
| [`toMap()`](https://pub.dev/documentation/yaml_extension/latest/yaml_extension/YamlExtension/toMap.html) | Allows you to convert text data in YAML format to `Map<String, dynamic>` |

## Getting started

To use any functions of the package,
just [install and import it](https://pub.dev/packages/yaml_extension/install).

## Usage

Below are example of transformations of
[`pubspec.yaml`](https://github.com/iLnaar/yaml_extension/blob/master/pubspec.yaml) file of this package

Load `pubspec.yaml` file of this package as example:

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
method of [`object_extension`](https://pub.dev/packages/object_extension) package:

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
  description: 'Provides additional capabilities for yaml package.',
  version: '1.1.0',
  repository: 'https://github.com/iLnaar/yaml_extension',
  environment: {
    sdk: '^3.13.7'
  },
  dev_dependencies: {
    lints: '^1.0.0',
    test: '^1.16.0'
  },
  dependencies: {
    object_extension: '^1.0.3',
    yaml: '^3.1.4'
  }
}
```
