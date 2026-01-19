import 'dart:convert';
import 'dart:typed_data';

import 'package:shared_preferences/shared_preferences.dart';

const String _pdfStoragePrefix = 'webpdf_v1:';

Future<void> deleteIfExists(String path) async {
  if (!path.startsWith(_pdfStoragePrefix)) {
    return;
  }
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove(path);
}

Future<Uint8List> readBytes(String path) async {
  if (!path.startsWith(_pdfStoragePrefix)) {
    throw UnsupportedError('Local file reads are not supported on web.');
  }
  final prefs = await SharedPreferences.getInstance();
  final payload = prefs.getString(path);
  if (payload == null || payload.isEmpty) {
    throw StateError('PDF bytes not found for $path');
  }
  return Uint8List.fromList(base64Decode(payload));
}
