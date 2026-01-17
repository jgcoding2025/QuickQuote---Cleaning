import 'dart:io';
import 'dart:typed_data';

Future<void> deleteIfExists(String path) async {
  if (path.isEmpty) return;
  final file = File(path);
  if (await file.exists()) {
    await file.delete();
  }
}

Future<Uint8List> readBytes(String path) async {
  final file = File(path);
  return file.readAsBytes();
}
