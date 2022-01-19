/*
 Created by Thanh Son on 19/01/2022.
 Copyright (c) 2022 . All rights reserved.
*/

import 'package:semi_logger/src/logger/semi_logger.dart';
import 'package:semi_logger/src/logger/style/semi_log_style.dart'
    show SemiLogContent;

part 'semi_log_level_data.dart';

/// Log level for styling print
enum SemiLogLevel {
  // The name of logger, which between of square bracket []
  header,

  // The line mark (include debug mode)
  separator,

  // Print only on debug mode
  debug,

  // Warning level (include debug mode)
  warning,

  // Error level (include debug mode)
  error,

  // Info level (include debug mode)
  info,

  // a level on debug mode
  success,

  // a level on debug mode
  fail,

  // print with print() function, skip styling
  print
}
