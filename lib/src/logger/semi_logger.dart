/*
 Created by Thanh Son on 19/01/2022.
 Copyright (c) 2022 . All rights reserved.
*/
import 'package:semi_exception/src/logger/semi_log_level.dart';
import 'dart:core' as core;

SemiLogger _inst = SemiLogger.setup();

const line = '==========================================';

class SemiLogger {
  const SemiLogger._({
    required this.name,
    required this.debugMode,
    required this.styleData,
  });

  factory SemiLogger() => _inst;

  factory SemiLogger.setup({
    core.String name = 'semi-log',
    core.bool debugMode = true,
    SemiLogStyleData styleData = const SemiLogStyleData(),
  }) {
    _inst = SemiLogger._(
      name: name,
      debugMode: debugMode,
      styleData: styleData,
    );
    return _inst;
  }

  factory SemiLogger.instance({
    core.String? name = 'semi-log',
    core.bool? debugMode = true,
  }) {
    return SemiLogger._(
      name: name ?? _inst.name,
      debugMode: debugMode ?? _inst.debugMode,
      styleData: _inst.styleData,
    );
  }

  final core.String name;
  final core.bool debugMode;
  final SemiLogStyleData styleData;

  void print(core.dynamic object) {
    core.print(object);
  }

  void log(
      {SemiLogLevel level = SemiLogLevel.debug, required core.String message}) {
    if (debugMode) {
      print('$_header ${styleData.apply(message, level)}');
    }
  }

  void e(core.String message) {
    log(message: message, level: SemiLogLevel.error);
  }

  void i(core.String message) {
    log(message: message, level: SemiLogLevel.info);
  }

  void w(core.String message) {
    log(message: message, level: SemiLogLevel.warning);
  }

  void d(core.String message) {
    log(message: message, level: SemiLogLevel.debug);
  }

  void start([core.String message = 'START ', core.String line = line]) {
    log(message: '$message$line', level: SemiLogLevel.start);
  }

  void end([core.String message = 'END ', core.String line = line]) {
    log(message: '$message$line', level: SemiLogLevel.end);
  }

  void success(core.String message) {
    log(message: message, level: SemiLogLevel.success);
  }

  void fail(core.String message) {
    log(message: message, level: SemiLogLevel.fail);
  }

  core.String get _header {
    return styleData.header.apply('[$name]');
  }
}
