/*
 Created by Thanh Son on 19/01/2022.
 Copyright (c) 2022 . All rights reserved.
*/
import 'package:semi_exception/src/logger/log_colored.dart' as colored;

enum SemiLogLevel {
  header,
  end,
  start,
  debug,
  warning,
  error,
  info,
  success,
  fail,
}

class SemiLogStyleData {
  const SemiLogStyleData({
    this.header = const SemiLogStyle(
        color: colored.ANSIStyles.white, bg: colored.ANSIStyles.bgLightRed),
    this.start = const SemiLogStyle(
        color: colored.ANSIStyles.white, bg: colored.ANSIStyles.bgMagenta),
    this.end = const SemiLogStyle(
        color: colored.ANSIStyles.white, bg: colored.ANSIStyles.bgMagenta),
    this.debug = const SemiLogStyle(),
    this.warning = const SemiLogStyle(color: colored.ANSIStyles.yellow),
    this.error = const SemiLogStyle(color: colored.ANSIStyles.red),
    this.info = const SemiLogStyle(),
    this.fail = const SemiLogStyle(color: colored.ANSIStyles.magenta),
    this.success = const SemiLogStyle(color: colored.ANSIStyles.green),
  });

  final SemiLogStyle header;
  final SemiLogStyle start;
  final SemiLogStyle end;
  final SemiLogStyle debug;
  final SemiLogStyle warning;
  final SemiLogStyle error;
  final SemiLogStyle info;
  final SemiLogStyle success;
  final SemiLogStyle fail;

  SemiLogStyle getStyle(SemiLogLevel level) {
    switch (level) {
      case SemiLogLevel.header:
        return header;
      case SemiLogLevel.end:
        return end;
      case SemiLogLevel.start:
        return start;
      case SemiLogLevel.debug:
        return debug;
      case SemiLogLevel.warning:
        return warning;
      case SemiLogLevel.error:
        return error;
      case SemiLogLevel.info:
        return info;
      case SemiLogLevel.success:
        return success;
      case SemiLogLevel.fail:
        return fail;
    }
  }

  String apply(String text, SemiLogLevel level) {
    return getStyle(level).apply(text);
  }
}

class SemiLogStyle {
  const SemiLogStyle({
    this.color = colored.ANSIStyles.defaultStyle,
    this.bg = colored.ANSIStyles.bgDefault,
  });

  final colored.ANSIStyles color;
  final colored.ANSIStyles bg;

  String apply(String text) {
    return colored.apply(text, color: color, bg: bg);
  }
}
