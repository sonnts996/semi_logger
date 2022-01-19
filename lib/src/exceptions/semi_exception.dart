/*
 Created by Thanh Son on 19/01/2022.
 Copyright (c) 2022 . All rights reserved.
*/


import 'package:semi_logger/src/logger/level/semi_log_level.dart';
import 'package:semi_logger/src/logger/style/semi_log_style.dart' show SemiLogContent;
import 'package:semi_logger/src/logger/semi_logger.dart';

/// Depend on Exception,
/// SemiException provide a model, which is contains basic data for handling
/// error and exception.
///
class SemiException implements Exception {
  const SemiException(
    this.errorCode, {
    this.message,
    this.error,
    this.stackTrace,
    this.time,
  });

  /// Each exception has a identification code, let the program detach what it
  /// will do next
  final String errorCode;

  /// Log the message of this exception
  final String? message;

  /// The source error or exception
  final dynamic error;

  /// The stackTrace
  final StackTrace? stackTrace;

  /// The time, when exception occurs
  final DateTime? time;

  /// Log to console this exception
  void print({SemiLogger? logger, bool debugMode = true}) {
    if (debugMode) {
      var _logger =
          logger ?? SemiLogger.instance(name: errorCode, debugMode: debugMode);

      final messages = <SemiLogLevelData>[];
      final contents = <SemiLogContent>[];
      if (message != null) {
        contents.add(SemiLogLevel.error.toContent(_logger, message!));
      }
      if (time != null) {
        contents.add(SemiLogLevel.info.toContent(_logger, 'at ${time!.toIso8601String()}'));
      }
      if(contents.isNotEmpty){
        messages.add(SemiLogLevelData.fromContents(contents));
      }
      if (error != null) {
        messages.add(SemiLogLevel.separator.msg('With error: '));
        messages.add(SemiLogLevel.print.msg(error.toString()));
      }
      if (stackTrace != null) {
        if (error == null) {
          messages.add(SemiLogLevel.separator.msg('StackTrace: '));
        }
        messages.add(SemiLogLevel.print.msg(stackTrace.toString()));
      }
      _logger.block(messages);
    }
  }

  @override
  String toString() {
    String rs = '$errorCode:';
    if (message != null) {
      rs += ' message!';
    }

    if (time != null) {
      rs += ' at ${time!.toIso8601String()}';
    }

    if (error != null) {
      rs += ' on ${error.toString()}';
    }
    return rs;
  }
}
