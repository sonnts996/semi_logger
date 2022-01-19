## Features

Logger with colorful

log data:
![block](https://raw.githubusercontent.com/sonnts996/assets/main/semi_logger_block.png)

semi_exception
![semi_exception](https://raw.githubusercontent.com/sonnts996/assets/main/semi_logger_error.png)

## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package.

## Usage

Import packages:

```dart
import 'package:semi_logger/semi_logger.dart';
```

Set up:
```dart
  SemiLogger.setup(
    name: 'Semi Logger Test',
    debugMode: true,
    styleData: SemiLogStyleData(),
  );
```

Print log:
```dart
  SemiLogger().log(message: 'Hello World', level: SemiLogLevel.info);
```

or
```dart
  SemiLogLevel.info.log('Hello World');
```

You can override log name with SemiLogger.instance()
```dart
  SemiLogger.instance(name: 'Hello').i('Hello World');
```

## Features and bugs

Please file feature requests and bugs at the [issue tracker][https://github.com/sonnts996/semi_logger/issues].


