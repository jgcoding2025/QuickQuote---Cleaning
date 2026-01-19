import 'dart:convert';
import 'dart:typed_data';

import 'package:shared_preferences/shared_preferences.dart';

const String _pdfStoragePrefix = 'webpdf_v1:';

Future<String> savePdfToLocalFile({
  required String orgId,
  required String quoteId,
  required String docId,
  required Uint8List bytes,
}) async {
  final key = '$_pdfStoragePrefix$orgId:$quoteId:$docId';
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString(key, base64Encode(bytes));
  return key;
}
