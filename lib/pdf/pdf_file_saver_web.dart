import 'dart:typed_data';

Future<String> savePdfToLocalFile({
  required String orgId,
  required String quoteId,
  required String docId,
  required Uint8List bytes,
}) async {
  // No local file system access on web. Returning an empty string keeps the
  // data model intact while allowing the web build to compile and run.
  return '';
}
