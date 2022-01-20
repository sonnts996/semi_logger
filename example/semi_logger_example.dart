import 'package:semi_logger/semi_logger.dart';

void helloWorld(bool semi) {
  if (semi) {
    throw SemiException(
      'unimplemented-error',
      message: 'Error log test',
      error: UnimplementedError(),
      time: DateTime.now(),
      stackTrace: StackTrace.current,
    );
  }
  throw UnimplementedError();
}

void main() {
  const content = [
    SemiLogContent('Hello, '),
    SemiLogContent('this text is on', color: ANSIStyles.lightGreen),
    SemiLogContent('Custom', fontStyle: ANSIStyles.bold),
    SemiLogContent('print test!',
        fontStyle: ANSIStyles.bold, color: ANSIStyles.red),
  ];

  SemiLogger.setup(
    name: 'Semi Logger Test',
    debugMode: true,
    styleData: SemiLogStyleData(),
  );
  SemiLogger().block(
    [
      SemiLogLevel.separator.msg('Start block '),
      SemiLogLevel.info.msg('This is the block test'),
      SemiLogLevel.warning.msg('printing...'),
      SemiLogLevel.print.custom(content),
      SemiLogLevel.separator.msg('End block '),
    ],
    linePrefix: '>',
    lineNumber: true,
  );
  SemiLogger().separator();
  try {
    helloWorld(true);
  } on SemiException catch (e) {
    e.print();
  } catch (e) {
    SemiLogger().log(message: e.toString(), level: SemiLogLevel.error);
  }
  SemiLogger().separator();
  SemiLogger().custom(content);
}
