import 'dart:io';

import 'package:path/path.dart' show posix;

extension FileExists on File {
  Future<void> ensureExists() async {
    if (!await exists()) await create();
  }
}

final _dir = posix.dirname(Platform.script.path);
final _relativeDir = posix.relative(
  _dir,
  // move up two steps for useful stuff
  from: posix.dirname(posix.dirname(_dir)),
);

final input = File(posix.join(_relativeDir, 'input.txt'));

final inputContents = input.readAsStringSync();

final output1 = File(posix.join(_relativeDir, 'output1.txt'));
final output2 = File(posix.join(_relativeDir, 'output2.txt'));
