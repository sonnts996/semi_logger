import 'package:semi_exception/src/exceptions/semi_exception.dart';
import 'package:semi_exception/src/logger/semi_log_level.dart';
import 'package:semi_exception/src/logger/semi_logger.dart';

void helloWorld(bool semi) {
  if (semi) {
    throw SemiException(
      'unimplemented-error',
      error: UnimplementedError(),
      time: DateTime.now(),
      stackTrace: StackTrace.current,
    );
  }
  throw UnimplementedError();
}

void main() {
  // print('\u{1B}[31m\u{1B}[103mHello World!\u{1B}[0m');
  SemiLogger.setup(styleData: SemiLogStyleData());
  SemiLogger().log(message: 'Start log', level: SemiLogLevel.start);
  SemiLogger().log(message: 'Hello World!');
  SemiLogger().log(message: 'Hello World!', level: SemiLogLevel.success);
  try {
    helloWorld(true);
  } on SemiException catch (e) {
    e.printStackTrace();
  } catch (e) {
    SemiLogger().log(message: e.toString(), level: SemiLogLevel.error);
  }
  SemiLogger().log(message: 'End log!', level: SemiLogLevel.end);
}
