/*
 Created by Thanh Son on 19/01/2022.
 Copyright (c) 2022 . All rights reserved.
*/
import 'package:semi_exception/src/logger/semi_logger.dart';

class SemiException implements Exception {
  const SemiException(this.errorCode, {
    this.errorMessage,
    this.error,
    this.stackTrace,
    this.time,
  });

  final String errorCode;
  final String? errorMessage;
  final dynamic error;
  final StackTrace? stackTrace;
  final DateTime? time;

  void printStackTrace({SemiLogger? logger, bool debugMode = true}) {
    if(debugMode) {
      var _logger = logger ?? SemiLogger.instance(name: errorCode, debugMode: debugMode);
      if (errorMessage != null){
        _logger.e(errorMessage!);
      }
      if(time != null) {
        _logger.i('at ${time!.toIso8601String()}');
      }
      if(error != null){
        _logger.start('With error:');
        _logger.print(error.toString());
      }
      if(stackTrace != null) {
        if(error == null) {
          _logger.start('StackTrace:');
        }
        _logger.print(stackTrace.toString());
      }
    }
  }
}
