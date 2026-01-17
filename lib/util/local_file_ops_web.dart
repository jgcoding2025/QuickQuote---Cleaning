import 'dart:typed_data';

Future<void> deleteIfExists(String path) async {
  // No-op on web (no local file system access via dart:io).
}

Future<Uint8List> readBytes(String path) async {
  throw UnsupportedError('Local file reads are not supported on web.');
}
